{ config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    cantarell-fonts
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.noto
    noto-fonts
    dosis
  ];
}