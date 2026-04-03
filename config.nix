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

  noctalia = {
    dock-panel = [
      "firefox"
      "codium"
      "kitty"
      "spotify"
      "org.telegram.desktop"
      "krita"
    ];

    bar = {
      left = [
        {
          defaultSettings = {
            activeColor = "primary";
            enableToast = true;
            hideInactive = false;
            iconSpacing = 4;
            inactiveColor = "none";
            removeMargine = false;
          };
          id = "plugin:privacy-indicator";
        }
        {
          clockColor = "none";
          formatHorisontal = "h:mm AP ddd MMM d";
          formatVertical = "h:mm AP - dd MM";
          id = "Clock";
        }
        {
          id = "SystemMonitor";
        }
        {
          id = "ActiveWindow";
        }
        {
          id = "MediaMini";
        }
      ];
      center = [
        {
          characterCount = 2;
          colorizeIcons = false;
          emptyColor = "secondary";
          enableScrollWheel = true;
          focusedColor = "primary";
          followFocusedScreen = false;
          fontWeight = "bold";
          groupedBorderOpacity = 1;
          hideUnoccupied = true;
          iconScale = 0.8;
          id = "Workspace";
          labelMode = "none";
          occupiedColor = "secondary";
          pillSize = 0.6;
          showApplications = true;
          showApplicationsHover = true;
          showBadge = true;
          showLabelsOnlyWhenOccupied = true;
          unfocusedIconsOpacity = 1;
        }
      ];
      right = [
        {
          id = "Tray";
        }
        {
          displayMode = "forceOpen";
          iconColor = "none";
          id = "KeyboardLayout";
          showIcon = true;
          textColor = "none";
        }
        {
          id = "plugin:screen-recorder";
        }
        {
          id = "NotificationHistory";
        }
        {
          id = "Battery";
        }
        {
          id = "Volume";
        }
        {
          id = "Brightness";
        }
        {
          id = "plugin:color-scheme-creator";
        }
        {
          colorizeSystemIcon = true;
          enableColorization = false;
          icon = "noctalia";
          id = "ControlCenter";
          useDistroLogo = true;
        }
      ];
    };
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
