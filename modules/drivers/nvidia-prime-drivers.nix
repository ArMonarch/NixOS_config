{
  lib,
  config,
  # pkgs,
  ...
}: let
  cfg = config.drivers;
in {
  # options.drivers.nvidia-prime = {
  #   enable = lib.mkEnableOption "Enable Nvidia Prime Hybrid GPU Offload";
  #   intelBusID = lib.mkOption {
  #     type = lib.types.str;
  #     default = "PCI:0:2:0";
  #   };
  #   nvidiaBusID = lib.mkOption {
  #     type = lib.types.str;
  #     default = "PCI:1:0:0";
  #   };
  # };
  #
  # config = lib.mkIf cfg.nvidia-prime.enable {
  #   hardware = {
  #     nvidia = {
  #       # Config for hybrid Intel+Nvidia Laptop
  #       prime = {
  #         # Optimized configuration for switchable graphics laptops
  #         offload = {
  #           enable = true;
  #           enableOffloadCmd = true;
  #         };
  #         # sync.enable disabled as offload is generally better for laptops
  #         sync.enable = false;
  #         # Make sure to use the correct Bus ID values for your system!
  #         intelBusId = "${cfg.nvidia-prime.intelBusID}";
  #         nvidiaBusId = "${cfg.nvidia-prime.nvidiaBusID}";
  #       };
  #     };
  #   };
  # };

  # TODO: Only for Testing Purpose
  hardware = {
    nvidia = {
      # Config for hybrid Intel+Nvidia Laptop
      prime = {
        # Optimized configuration for switchable graphics laptops
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        # sync.enable disabled as offload is generally better for laptops
        sync.enable = false;
        # Make sure to use the correct Bus ID values for your system!
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
