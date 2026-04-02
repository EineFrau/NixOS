{pkgs, ...}: {
  programs.nvf.settings.vim = {
    statusline.lualine.enable = true;
    mini.tabline.enable = true;
    tabline.nvimBufferline = {
      enable = true;
    };
    maps.normal = {
      "<Tab>".action = "<cmd>BufferLineCycleNext<CR>";
      "<S-Tab>".action = "<cmd>BufferLineCyclePrev<CR>";
    };
  };
}
