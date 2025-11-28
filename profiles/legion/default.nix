{inputs, ...}: {
  imports = [
    ./hardware.nix # Define the result of the hardware scan.
    ../../modules/drivers/nvidia.nix # Define those S**t Nvidia drivers, that are almost always the problems.

    # load core modules one by one as needed
    ../../modules/core/boot.nix # boot configurations (packages, services, boot-loader etc)
    ../../modules/core/fonts.nix # fonts packages
    ../../modules/core/hardware.nix # extra hardware config for bluetooth.
    ../../modules/core/network.nix # network configurations.
    ../../modules/core/nh.nix # Best nix helper tools
    ../../modules/core/packages.nix # Define packages
    ../../modules/core/security.nix # Define security configurations
    ../../modules/core/services.nix # Define needed Services
    ../../modules/core/display/default.nix # Config for Display manager & Desktop manager
    ../../modules/core/printing.nix # config for printing
    ../../modules/core/system.nix # System configurations
    ../../modules/core/user.nix # User configurations
    ../../modules/core/virtualisation.nix # virtualisation setup
    ../../modules/core/xserver.nix # xserver configurations

    # theme generation
    inputs.stylix.nixosModules.stylix
    ../../modules/core/stylix.nix

    # Home Manager setup
    inputs.home-manager.nixosModules.home-manager
    ../../modules/core/home-manager.nix
  ];
}
