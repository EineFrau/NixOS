{
  hostname = "nixos";
  user = "s1ndl3s";
  home-directory = "/home/s1ndl3s";
  timeZone = "Europe/Bratislava";
  stateVersion = "25.05";
  stateHomeVersion = "26.05";
  display = "eDP-1";
  displayResolution = "1920x1080@120.030";

  git = {
    userName = "EineFrau";
    userEmail = "";
  };

  niriLang = "de"; # Sie können Sprachen mit "," hinzifügen; Beispiel "de,us"
  fetchLogo = "special"; # none, small, full oder special

  # Weitere Themen finden Sie unter dem https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/system/boot/plymouth.nix
  plymouthTheme = "matrix"; # Du kannst null oder "" verlassen
  plymouthPackage = "plymouth-matrix-theme";

  # CPU
  cpuVendor = "amd"; # "intel" oder "amd"

  # GPU
  gpuVendor = "amdgpu"; # "nvidia", "amdgpu", "intel". Standart "intel"
  opengl = false;

  # NVIDIA
  nvidiaOpen = true; # false wenn ihre GPU älter ist GTX1060
  # NVIDIA + INTEL
  prime = {
    enable = false;
    offload = true;
    sync = false; # Nur Nvidia, offload = false;
    intelBusId = ""; # lspci | grep -E "VGA|3D"
    nvidiaBusId = ""; # lspci | grep -E "VGA|3D"
  };

  # Firewall
  firewall = {
    enable = true;
    allowPing = false;
  };
}
