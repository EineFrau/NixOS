{pkgs, ...}: {
  programs.nvf.settings.vim.filetree.neo-tree = {
    enable = true;
    setupOpts = {
      enable_git_status = true;
      enable_modified_markers = true;
      enable_opened_markers = true;
      enable_refresh_on_write = true;
      git_status_async = true;
      hide_root_node = false;
      add_blank_line_at_top = true;
      hijack_netrw_behaviour = "open_current";
    };
  };
}
