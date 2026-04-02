{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = import ./config.nix;
in {
  imports = [
    ./imports.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager.users.${cfg.user} = {
    imports = [
      inputs.nvf.homeManagerModules.default
      inputs.noctalia.homeModules.default
      ./home/home.nix
    ];
    _module.args.inputs = {
      inherit inputs;
    };
  };
}
