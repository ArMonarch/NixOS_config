{ pkgs, ... }:

let
  theme-profile = "wuthering-wave"; # [ "wuthering-wave" "hollow-knight"]
  theme-name = "jianxin"; # [ "changli" "jianxin" "jinxi" "kakaluo" "yinlin" ]
in 
{
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 10;

  # Grub Theme Install
  boot.loader.grub.theme = "./grub-themes-NixOS/${theme-profile}/${theme-name}";
}
