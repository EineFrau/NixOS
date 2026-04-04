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
      enable = if cfg.plymouthTheme != null && cfg.plymouthTheme == "" && cfg.plymouthTheme != false then true else false;
      theme =
        if cfg.plymouthTheme != null && cfg.plymouthTheme == ""
        then cfg.plymouthTheme
        else null;
      themePackages =
        if cfg.plymouthPackage != null && cfg.plymouthPackage != ""
        then [pkgs.${cfg.plymouthPackage}]
        else [];
    };
  };
}
