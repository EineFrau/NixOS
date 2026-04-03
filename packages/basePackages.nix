{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    wget
    eza
    home-manager
    xwayland-satellite
  ];
}

