{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot.initrd = {
    availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "ahci"
      "nvme"
      "usbhid"
    ];
    kernelModules = [];
  };

  boot.kernelModules = ["kvm-intel"];

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4776-9B59";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/0f37a2f5-881a-462c-8472-9b69eacaf505";
    fsType = "ext4";
  };

  # Windows partation mount as /home/frenzfries/Windows.
  fileSystems."/home/frenzfries/Windows" = {
    device = "/dev/disk/by-uuid/62A443AFA443850F";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
      "gid=1000"
      "x-gvfs-name=Windows"
    ];
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024; # 8 GB Swapfile
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
