{
  imports = [
    ./hardware-configuration.nix
    ./services/baseService.nix
    ./services/xdgPortal.nix
    ./system/nix.nix
    ./system/boot.nix
    ./system/hardware.nix
    ./system/systemBase.nix
    ./user/basicUser.nix
    ./programs/basePrograms.nix
    ./networking/baseNetwork.nix
    ./packages/basePackages.nix
    ./packages/noctaliaPackage.nix
    ./user/time.nix
    ./services/sddmService.nix
  ];
}
