{
  imports = [
    ./terminal/terminalImports.nix
    ./terminal/baseTerminal.nix
    ./terminal/gitSettings.nix
    ./programs/niri.nix
    ./programs/noctalia.nix
    ./programs/kitty.nix
    ./programs/fastfetch.nix
    ./packages/specialPackages.nix
    ./packages/sysPackages.nix
    ./packages/terminalPackages.nix
    ./packages/userPackages.nix
    ./ui/fonts.nix
    ./ui/themes.nix
  ];
}
