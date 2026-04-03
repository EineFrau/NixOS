{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    nodejs
    python3
    python313Packages.pip
    cargo
    cmake
    go
    delve
    go-tools
    gnumake
    rustc
    mesa
    ninja
    typescript
    pnpm
    yarn
  ];
}

