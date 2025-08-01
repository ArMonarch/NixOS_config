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
    ./gdm.nix # Config for Display manager & Desktop manager
    ./system.nix # System configurations
    ./user.nix # User configurations & home-manager initialization
    ./virtualisation.nix
    ./xserver.nix # xserver configurations

    # Best theme generation
    inputs.stylix.nixosModules.stylix
    ./stylix.nix
  ];
}
