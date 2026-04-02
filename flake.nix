{
  description = "Idk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
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
      inputs.nixpkgs.follows = "nixpkgs";
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
    cfg = import ./config.nix;
    system = "x86_64-linux";

    safeHostname = builtins.replaceStrings [" "] ["-"] cfg.hostname;
  in {
    nixosConfigurations.${cfg.hostname} =  nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
      ];
      specialArgs = {inherit cfg; inputs = { inherit noctalia nvf; };};
    };

    homeConfigurations.${cfg.user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home/home.nix 
        nvf.homeManagerModules.default 
        noctalia.homeModules.default
      ];
      extraSpecialArgs = { inherit cfg; inputs = { inherit noctalia nvf; }; };
    };
  };
}
