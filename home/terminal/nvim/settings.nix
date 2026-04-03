{pkgs, ...}: {
  programs.nvf.settings.vim = {
    viAlias = false;
    vimAlias = true;
    globals.mapleader = "C";
    #spellcheck.enable = true;
    options = {
      updatetime = 100;
      autoindent = true;
      smartindent = true;
      tabstop = 2;
      shiftwidth = 2;
    };

    #luaConfigPost = ''
    #  local parser_install_dir = vim.fn.stdpath("data") .. "/parsers"
    #  vim.opt.runtimepath:append(parser_install_dir)
    #  require'nvim-treesitter.configs'.setup {
    #    parser_install_dir = parser_install_dir,
    #    ensure_installed = { "nix", "lua" },
    #    highlight = { enable = true },
    #    indent = { enable = true },
    #    incremental_selection = { enable = true },
    #  }
    #'';
    maps.normal = {
      "<C-n>".action = "<cmd>Neotree toggle<CR>";
    };
  };
}
