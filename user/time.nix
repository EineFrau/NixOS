{
  config,
  lib,
  ...
}: let
  cfg = import ../config.nix;
in {
  time.timeZone = cfg.timeZone;
}
