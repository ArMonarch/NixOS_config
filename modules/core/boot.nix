{config, ...}: let
  theme-profile = "wuthering-wave"; # [ "wuthering-wave" "hollow-knight"]
  theme-name = "changli"; # [ "changli" "jianxin" "jinxi" "kakaluo" "yinlin" ]
in {
  boot = {
    kernelModules = ["v4l2loopback"];
    extraModulePackages = [config.boot.kernelPackages.v4l2loopback];
  };

  # Disable systemd-boot
  boot.loader.systemd-boot.enable = false;

  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.devices = ["nodev"];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 10;

  # Grub Theme Install
  boot.loader.grub.theme = "/home/frenzfries/Dev/NixOS_config/modules/core/grub-themes/${theme-profile}/${theme-name}";
  boot.loader.grub.splashImage = null; # Brief image shown after selecting grub option and before kernel loader.
}
