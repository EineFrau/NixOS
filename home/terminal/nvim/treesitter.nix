{
  pkgs,
  lib,
  ...
}: {
  programs.nvf.settings.vim = {
    #utility.nvim-biscuits.enable = false;
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = false;
      fold = false;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
    extraPlugins = {
      nvim-treesitter = {
        package = pkgs.vimPlugins.nvim-treesitter;
      };
    };
  };
  #programs.nvf.settings.vim.lazy = {
  #  enable = false;
  #};
}
