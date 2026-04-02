{ config, 
  pkgs, 
  ... 
}: let
  cfg = import ../../config.nix;
in {
  programs.git = {
    enable = true;
    settings = {
      user = { 
        name = cfg.git.userName;
        email = cfg.git.userEmail;
      };
    };
  };
}