{ config,
  lib,
  pkgs,
  ...
}: let
  cfg = import ../config.nix;
in {
  programs = {
    command-not-found.enable = true;
    dconf.enable = true;
    fish.enable = true;
    firefox.enable = true;
    niri.enable = true;
    steam.enable = true;
    xwayland.enable = true;
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
        # Префикс для команд tmux - Ctrl+a (как в screen, удобнее чем Ctrl+b)
        set -g prefix C-a
        unbind C-b
        bind C-a send-prefix

        # Разделение окон: | - вертикально, - - горизонтально
        bind | split-window -h
        bind - split-window -v

        # Навигация по панелям: h j k l (как в vim)
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        # Изменение размера панелей: Shift + h j k l
        bind H resize-pane -L 5
        bind J resize-pane -D 5
        bind K resize-pane -U 5
        bind L resize-pane -R 5

        # Создание нового окна: c
        # Переключение окон: n p (следующее/предыдущее) или 0-9

        # Статус-бар: чёрный фон, белый текст
        set -g status-bg black
        set -g status-fg white
        set -g status-left '#[fg=green]#S '  # Имя сессии слева
        set -g status-right '#[fg=yellow]#(date +"%H:%M %d-%b-%y") '  # Время справа

        # Включить мышь для удобства (выделение, прокрутка)
        set -g mouse on

        # Нумерация окон и панелей с 1 (удобнее)
        set -g base-index 1
        set -g pane-base-index 1

        # Автоматическое переименование окон
        set -g automatic-rename on

        # История команд: увеличить до 10000 строк
        set -g history-limit 10000

        # Режим копирования: v - начать выделение, y - скопировать (tmux-yank)
        # В режиме копирования: h j k l для навигации

        # Плагины:
        # tmux-resurrect: Ctrl+s - сохранить сессию, Ctrl+r - восстановить
        # tmux-continuum: авто-сохранение каждые 15 мин
        # tmux-yank: y в режиме копирования копирует в системный буфер
        # tmux-prefix-highlight: показывает префикс в статус-баре
        # tmux-sensible: разумные дефолты
        # tmux-pain-control: дополнительные горячие клавиши
        # tmux-fzf: Ctrl+f - поиск окон/панелей
        # tmux-sidebar: Ctrl+b Tab - открыть боковую панель с файлами
      '';
    };
  };
}