{ 
  config,
  inputs,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;
  };
}
