{
  lib,
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["modesetting" "nvidia"];

  # Blacklist nouveau to avoid conflicts
  boot.blacklistedKernelModules = ["nouveau"];

  # Configuration for proprietary packages
  nixpkgs.config = {
    nvidia.acceptLicense = true;
    cudaSupport = true; # enable cuda support
    allowUnfree = true; # Simplified from specific allowUnfreePredicate
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };

    nvidia = {
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
    };
  };
}
