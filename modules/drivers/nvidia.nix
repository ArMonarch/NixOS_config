{
  lib,
  config,
  pkgs,
  ...
}: {
  # Cooling Management.
  services.thermald.enable = lib.mkDefault true;

  # Enable Unfree software.
  nixpkgs.config = {
    allowUnfree = true;
  };

  services.xserver.videoDrivers = [
    "modesetting" # example for Intel iGPU; use "amdgpu" here instead if your iGPU is AMD
    "nvidia"
  ];

  # Activate When Needed
  # Preserve video memory after suspend
  boot.kernelParams = [
    # "nvidia-drm.modeset=1" # Enable mode setting for Wayland
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1" # Improves resume after sleep
    # "nvidia.NVreg_RegistryDwords=PowerMizerEnable=0x1;PerfLevelSrc=0x2222;PowerMizerLevel=0x3;PowerMizerDefault=0x3;PowerMizerDefaultAC=0x3" # Performance/power optimizations
  ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vulkan-loader
        vulkan-validation-layers
        libva
      ];
    };

    nvidia = {
      modesetting.enable = true;
      # Nvidia power management. Experimental, and ?`can cause sleep/suspend to fail.`
      powerManagement.enable = lib.mkForce true;
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = lib.mkForce true;

      open = true;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # Config for hybrid Intel + Nvidia Laptop
      prime = {
        # Optimized configuration for switchable graphics laptops
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        sync.enable = false;
        reverseSync.enable = false;
        # Make sure to use the correct Bus ID values for your system!
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  # Additional useful packages
  environment.systemPackages = with pkgs; [
    vulkan-tools
    glxinfo
    libva-utils
  ];
}
