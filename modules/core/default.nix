{inputs, ...}: {
  imports = [
    ./boot.nix # boot configurations (packages, services, boot-loader etc)
    ./fonts.nix # fonts packages
    ./hardware.nix # extra hardware config from those generated through nixos-generate-config.
    ./network.nix # network configurations.
    ./nh.nix # Best nix helper tools
    ./packages.nix # Define packages
    ./security.nix # Define security configurations
    ./services.nix # Define needed Services
    ./display/default.nix # Config for Display manager & Desktop manager
    ./printing.nix # config for printing
    ./system.nix # System configurations
    ./user.nix # User configurations
    ./virtualisation.nix # virtualisation setup
    ./xserver.nix # xserver configurations

    # theme generation
    inputs.stylix.nixosModules.stylix
    ./stylix.nix

    # Home Manager setup
    inputs.home-manager.nixosModules.home-manager
    ./home-manager.nix
  ];
}
