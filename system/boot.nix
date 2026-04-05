{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = import ../config.nix;
in {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth = {
      enable = cfg.plymouth.enable;

      theme =
        if cfg.plymouth.theme != null && cfg.plymouth.theme != ""
        then cfg.plymouth.theme
        else "bgrt";

      themePackages =
        if cfg.plymouth.package != null && cfg.plymouth.package != ""
        then [(lib.getAttr cfg.plymouth.package pkgs)]
        else [];
    };
  };
}
