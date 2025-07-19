{lib, ...}: {
  hardware = {
    nvidia = {
      # Config for hybrid Intel + Nvidia Laptop
      prime = {
        # Optimized configuration for switchable graphics laptops
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        # sync disabled as offload is generally better for laptops
        sync.enable = false;
        # Make sure to use the correct Bus ID values for your system!
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
