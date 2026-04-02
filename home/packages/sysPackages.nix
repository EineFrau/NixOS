{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    mutagen
    ffmpeg
    libnotify
    jq
    wl-clipboard
    wtype

    loupe
    nemo
    gedit
    celluloid
    file-roller
    pavucontrol
    kitty
    nix-prefetch-scripts
    gpu-screen-recorder
  ];
}

