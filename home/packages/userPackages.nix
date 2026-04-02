{ 
  pkgs, 
  ... 
}: {
  home.packages = with pkgs; [
    discord
    firefox
    vscode
    vlc
    lutris
    steam
    obs-studio
    emacs
    krita
    sqlitebrowser
    libreoffice-qt6
    spotify
    obsidian
    calc
    telegram-desktop
    appimage-run
    dms
    dgop
    evince
    filezilla
  ];
}