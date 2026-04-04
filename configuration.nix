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
