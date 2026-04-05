{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = import ../config.nix;
in {
  programs = {
    command-not-found.enable = false;
    dconf.enable = true;
    fish.enable = true;
    firefox.enable = true;
    niri.enable = true;
    steam.enable = true;
    xwayland.enable = true;

    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs; [
        obs-studio-plugins.wlrobs
        obs-studio-plugins.obs-vkcapture
        obs-studio-plugins.obs-browser-transition
        obs-studio-plugins.obs-pipewire-audio-capture
      ];
    };

    tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        resurrect
        continuum
        yank
        prefix-highlight
        sensible
        pain-control
        fzf-tmux-url
        sidebar
      ];
      extraConfig = ''
        set -g prefix C-a
        unbind C-b
        bind C-a send-prefix

        bind ß split-window -h
        bind - split-window -v

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind H resize-pane -L 5
        bind J resize-pane -D 5
        bind K resize-pane -U 5
        bind L resize-pane -R 5

        set -g status-bg black
        set -g status-fg white
        set -g status-left '#[fg=green]#S '
        set -g status-right '#[fg=yellow]#(date +"%H:%M %d-%b-%y") '

        set -g mouse on

        set -g base-index 1
        set -g pane-base-index 1

        set -g automatic-rename on

        set -g history-limit 10000

        # Kopiermodus: v – Auswahl starten, y – Kopieren (tmux-yank)
        # Im Kopiermodus: h j k l zur Navigation

        # Plugins:
        # tmux-resurrect: Strg+s – Sitzung speichern, Strg+r – wiederherstellen
        # tmux-continuum: Alle 15 Minuten automatisch speichern
        # tmux-yank: y kopiert im Kopiermodus in den Systempuffer
        # tmux-prefix-highlight: Zeigt das Präfix in der Statusleiste an
        # tmux-sensible: sinnvolle Standardeinstellungen
        # tmux-pain-control: zusätzliche Hotkeys
        # tmux-fzf: Strg+f – nach Fenstern/Panels suchen
        # tmux-sidebar: Strg+b Tab – Seitenleiste mit Dateien öffnen
      '';
    };
  };
}
