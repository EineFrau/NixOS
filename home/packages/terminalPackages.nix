{ 
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    eza
    btop
    htop
    fastfetch
    zellij
    git
    git-lfs
    github-cli
    zip
    unzip
    cava
    cowsay
  ];
}