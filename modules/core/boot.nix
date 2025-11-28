{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelModules = ["v4l2loopback"];
    extraModulePackages = [config.boot.kernelPackages.v4l2loopback];
  };

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  # Disable systemd-boot
  boot.loader.systemd-boot.enable = false;

  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.devices = ["nodev"];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 10;
}
