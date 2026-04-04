{
  description = "Idk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf-nixpkgs.url = "github:NixOS/nixpkgs/cad22e7d996aea55ecab064e84834289143e44a0";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nvf-nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    noctalia,
    nvf,
    ...
  }: let
    overlays = [
      (import ./overlays/vesktopOverlay.nix)
      (import ./overlays/vscodiumOverlay.nix)
      (import ./overlays/obsidianOverlays.nix)
      (import ./overlays/spotifyOverlay.nix)
    ];
    cfg = import ./config.nix;
    system = "x86_64-linux";

    safeHostname = builtins.replaceStrings [" "] ["-"] cfg.hostname;
    nvfPkgs = nvf.inputs.nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.${cfg.hostname} = nixpkgs.lib.nixosSystem {
      pkgs = import nixpkgs {
        inherit system;
        overlays = overlays;
        config.allowUnfree = true;
      };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
      ];
      specialArgs = {
        inherit cfg;
        inputs = {inherit noctalia nvf;};
      };
    };

    homeConfigurations.${cfg.user} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        overlays = overlays;
      };
      #pkgs = nixpkgs.legacyPackages.${system};
      # overlays = overlays;
      modules = [
        ./home/home.nix
        nvf.homeManagerModules.default
        noctalia.homeModules.default
      ];
      extraSpecialArgs = {
        inherit cfg;
        inputs = {inherit noctalia nvf;};
      };
    };
    meinNvim =
      nvf.lib.neovimConfiguration
      {
        pkgs = nvfPkgs;
        modules = [
          ./home/terminal/nvim/autocomplete.nix
          ./home/terminal/nvim/autopairs.nix
          ./home/terminal/nvim/default.nix
          ./home/terminal/nvim/telescope.nix
          ./home/terminal/nvim/treesitter.nix
          ./home/terminal/nvim/settings.nix
          ./home/terminal/nvim/statusline.nix
          ./home/terminal/nvim/neotree.nix
          ./home/terminal/nvim/noice.nix
          ./home/terminal/nvim/lsp.nix
          ./home/terminal/nvim/ui.nix
        ];
      }.neovim;
  };
}
