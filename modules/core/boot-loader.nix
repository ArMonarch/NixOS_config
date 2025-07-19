{...}: let
  theme-profile = "wuthering-wave"; # [ "wuthering-wave" "hollow-knight"]
  theme-name = "changli"; # [ "changli" "jianxin" "jinxi" "kakaluo" "yinlin" ]
in {
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
}
