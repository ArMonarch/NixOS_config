{
  lib,
  config,
  pkgs,
  ...
}: {
  # Cooling Management
  services.thermald.enable = lib.mkDefault true;

  nixpkgs.config = {
    nvidia.acceptLicense = true;
    allowUnfree = true;
  };

  # Video drivers configuration for Xorg and Wayland
  # For offloadding `modesetting` is needed additionally
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
        mesa
        egl-wayland
        vulkan-loader
        vulkan-validation-layers
        libva
      ];
    };

    nvidia = {
      # Modesetting is Required
      modesetting.enable = true;
      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      powerManagement.enable = lib.mkDefault false;
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = lib.mkDefault false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of
      # supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;
      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;
      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;

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

  # NOTE: Intel+Nvidia Hybrid configuration taken from Nixy(https://github.com/anotherhadi/nixy)
  # Kernel parameters for better Wayland and Hyprland integration
  boot.kernelParams = [
    "nvidia-drm.modeset=1" # Enable mode setting for Wayland
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1" # Improves resume after sleep
    "nvidia.NVreg_RegistryDwords=PowerMizerEnable=0x1;PerfLevelSrc=0x2222;PowerMizerLevel=0x3;PowerMizerDefault=0x3;PowerMizerDefaultAC=0x3" # Performance/power optimizations
  ];

  # Environment variables for better compatibility
  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia"; # Hardware video acceleration
    XDG_SESSION_TYPE = "wayland"; # Force Wayland
    GBM_BACKEND = "nvidia-drm"; # Graphics backend for Wayland
    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; # Use Nvidia driver for GLX
    WLR_NO_HARDWARE_CURSORS = "1"; # Fix for cursors on Wayland
    NIXOS_OZONE_WL = "1"; # Wayland support for Electron apps
    __GL_GSYNC_ALLOWED = "1"; # Enable G-Sync if available
    __GL_VRR_ALLOWED = "1"; # Enable VRR (Variable Refresh Rate)
    WLR_DRM_NO_ATOMIC = "1"; # Fix for some issues with Hyprland
    NVD_BACKEND = "direct"; # Configuration for new driver
    MOZ_ENABLE_WAYLAND = "1"; # Wayland support for Firefox
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    vulkan-tools
    libva-utils
  ];
}
