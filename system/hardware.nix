{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = import ../config.nix;
in {
  hardware = {
    enableAllFirmware = true;
    graphics.enable = lib.mkForce true;

    cpu =
      lib.mkIf (cfg.cpuVendor == "amd") {
        amd.updateMicrocode = true;
      }
      // lib.mkIf (cfg.cpuVendor == "intel") {
        intel.updateMicrocode = true;
      };

    opengl.enable =
      if cfg.opengl == true
      then true
      else false;

    nvidia = lib.mkIf (cfg.gpuVendor == "nvidia") {
      modesetting.enable = true;
      open =
        if cfg.nvidiaOpen == true
        then true
        else false;
      nvidiaSettings = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      prime = lib.mkIf (cfg.prime.enable == true) {
        offload.enable =
          if cfg.prime.offload == true
          then true
          else false;
        sync.enable =
          if cfg.prime.sync == true && cfg.offload != true
          then true
          else false;
        intelBusId = cfg.prime.intelBusId;
        nvidiaBusId = cfg.prime.nvidiaBusId;
      };
    };
  };
}
