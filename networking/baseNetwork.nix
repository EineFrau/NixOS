{ config, lib, pkgs, ...}: 
let
  cfg = import ../config.nix;
in {
  networking = {
    hostName = cfg.hostname;
    networkmanager.enable = true;
    firewall = {
      enable = cfg.firewall.enable;
      allowPing = cfg.firewall.allowPing;
    };
  };
}