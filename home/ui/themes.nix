{
  config,
  pkgs,
  lib,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    gtk4.theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";

    style = {
      name = "adwaita";
      package = pkgs.adwaita-qt;
    };
  };

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "adwaita";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk";
    GTK_THEME = "Dracula";
  };
}
