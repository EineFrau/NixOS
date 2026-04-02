{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = import ../config.nix;
in {
  services = {
    blueman.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    udisks2.enable = true;
    upower.enable = true;

    getty = {
      autologinUser = cfg.user;
    };

    keyd = {
      enable = true;
      keyboards.default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "layer(symbols)";
          };
          symbols = {
            comma = "102nd";
            dot = "S-102nd";
          };
        };
      };
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
    };
  
    xserver = {
      videoDrivers =
        if cfg.gpuVendor == "nvidia"
        then ["nvidia"]
        else if cfg.gpuVendor == "amdgpu"
        then ["amdgpu"]
        else ["intel"];
      displayManager.startx.enable = true;
    };
  };
}
