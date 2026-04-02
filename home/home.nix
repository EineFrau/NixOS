{ config,
  lib,
  pkgs,
  ...
}: let
  cfg = import ../config.nix;
in {
  imports = [
    ./imports.nix
  ];

  home.username = cfg.user;
  home.homeDirectory = cfg.home-directory;
  home.stateVersion = cfg.stateVersion;
  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}