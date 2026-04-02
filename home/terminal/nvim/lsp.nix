{pkgs, ...}: {
  programs.nvf.settings.vim = {
    lsp = {
      formatOnSave = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      lspsaga.enable = true;
      trouble.enable = true;
      lspconfig.enable = true;
      nvim-docs-view.enable = true;
    };

    languages = {
      nix = {
        enable = true;
        lsp.enable = true;
        extraDiagnostics.enable = false;
        format.enable = true;
        treesitter.enable = true;
      };

      ts = {
        enable = true;
        lsp.enable = true;
        extraDiagnostics.enable = false;
        format.enable = true;
        treesitter.enable = true;
      };

      rust = {
        enable = true;
        lsp.enable = true;
        #extraDiagnostics.enable = true;
        format.enable = true;
        treesitter.enable = true;
      };

      lua = {
        enable = true;
        lsp.enable = true;
        extraDiagnostics.enable = true;
        format.enable = true;
        #treesitter.enable = true;
      };

      clang = {
        enable = true;
        lsp.enable = true;
        #extraDiagnostics.enable = true;
        #format.enable = true;
        treesitter.enable = true;
      };
      assembly = {
        enable = true;
        lsp.enable = true;
        #treesitter.enable = true;
      };
    };
  };
}
