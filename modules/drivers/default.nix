{lib, ...}: {
  imports = [
    ./nvidia-drivers.nix
    ./nvidia-prime-drivers.nix

    ./local-hardware-clock.nix
  ];

  # Cooling Management
  services.thermald.enable = lib.mkDefault true;

  # drivers.nvidia.enable = false;
  # drivers.nvidia-prime.enable = false;
}
