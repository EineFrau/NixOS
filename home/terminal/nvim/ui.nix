{pkgs, ...}: {
  programs.nvf.settings.vim = {
    visuals.indent-blankline = {
      enable = true;
    };
    theme = {
      enable = true;
      name = "github";
      style = "dark_high_contrast";
    };
  };
}
