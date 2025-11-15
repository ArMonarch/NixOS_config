{
  lib,
  config,
  pkgs,
  ...
}: {
  # Cooling Management.
  services.thermald.enable = lib.mkDefault true;

  services.xserver.videoDrivers = [
    "modesetting" # example for Intel iGPU; use "amdgpu" here instead if your iGPU is AMD
    "nvidia"
  ];

  # Activate When Needed
  # Preserve video memory after suspend
  boot.kernelParams = [
    # Enable IOMMU for compute workloads
    # "intel_iommu=on"
    # "iommu=pt"

    "nvidia.NVreg_PreserveVideoMemoryAllocations=1" # Improves resume after sleep
  ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libva
        mesa
        nvidia-vaapi-driver
        nv-codec-headers # Video Encoding
        vulkan-loader
        vulkan-validation-layers
      ];
    };

    nvidia = {
      modesetting.enable = true;
      # Nvidia power management. Experimental, and ?`can cause sleep/suspend to fail.`
      powerManagement.enable = lib.mkForce true;
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = lib.mkForce false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;
      open = true;

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
    };
  };

  # Additional useful packages
  environment.systemPackages = with pkgs; [
    vulkan-tools
    glxinfo
    libva-utils
  ];
}
