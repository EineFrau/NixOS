{
  config,
  lib,
  ...
}: let
  cfg = import ../config.nix;
in {
  system = {
    stateVersion = cfg.stateVersion;
  };
}
