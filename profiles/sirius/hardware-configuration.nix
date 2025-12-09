{
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
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/fb1bdd79-e274-40d4-a064-d9b41b6c0ada";
    fsType = "btrfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/FDF9-56F4";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
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
      size = 8 * 1024;
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
