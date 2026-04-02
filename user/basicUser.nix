{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = import ../config.nix;
in {
  users = {
    users = {
      "${cfg.user}" = {
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = ["wheel"];
      };
    };
  };
}
