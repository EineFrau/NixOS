{pkgs, ...}: {
  programs.nvf.settings.vim = {
    telescope = {
      enable = true;
    };

    maps.normal = {
      "<C-p>".action = "telescope.find_files";
      "<C-l>".action = "telescope.live_grep";
    };
  };
}
