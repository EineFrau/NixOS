{
  pkgs,
  lib,
  ...
}: {
  programs.nvf.settings.vim = {
    treesitter = {
      enable = lib.mkForce false;
      highlight.enable = true;
      indent.enable = false;
      fold = false;
    };
  };
}
