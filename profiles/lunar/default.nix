{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix # Define the result of the hardware scan.
    ../../modules/drivers/nvidia.nix # Define those S**t Nvidia drivers, that are almost always the problems.

    # load core modules one by one as needed
    ../../modules/core/boot.nix # boot configurations (packages, services, boot-loader etc)
    ../../modules/core/display-manager.nix # Config for Display manager & Desktop manager
    ../../modules/core/desktop-manager.nix # Config for Desktop manager
    ../../modules/core/fonts.nix # fonts packages
    ../../modules/core/hardware.nix # extra hardware config for bluetooth.
    ../../modules/core/network.nix # network configurations.
    ../../modules/core/nh.nix # Best nix helper tools
    ../../modules/core/packages.nix # Define packages
    ../../modules/core/printing.nix # config for printing
    ../../modules/core/security.nix # Define security configurations
    ../../modules/core/services.nix # Define needed Services
    ../../modules/core/system.nix # System configurations
    ../../modules/core/user.nix # User configurations
    ../../modules/core/virtualisation.nix # virtualisation setup
    ../../modules/core/xserver.nix # xserver configurations

    # theme generation
    inputs.stylix.nixosModules.stylix
    ../../modules/core/stylix.nix

    # Home Manager setup
    inputs.home-manager.nixosModules.home-manager
    ./home.nix
  ];
}
