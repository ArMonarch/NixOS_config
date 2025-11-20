{
  lib,
  config,
  pkgs,
  ...
}: {
  # Cooling Management.
  services.thermald.enable = lib.mkDefault true;

  services.xserver.videoDrivers = [
    # "modesetting" # example for Intel iGPU; use "amdgpu" here instead if your iGPU is AMD
    "nvidia"
  ];

  # Activate When Needed
  # Preserve video memory after suspend
  boot.kernelParams = [
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1" # Improves resume after sleep
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    # Nvidia power management. Experimental, and ?`can cause sleep/suspend to fail.`
    powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = lib.mkForce false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;
    open = false;

    # Config for hybrid Intel + Nvidia Laptop
    prime = {
      # Optimized configuration for switchable graphics laptops
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # Make sure to use the correct Bus ID values for your system!
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Additional useful packages
  environment.systemPackages = with pkgs; [
    vulkan-tools
    glxinfo
  ];
}
