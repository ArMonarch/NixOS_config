{inputs}: {
  imports = [
    ./boot.nix # boot configurations (packages, services, boot-loader etc)
    ./fonts.nix # fonts packages
    ./hardware.nix # extra hardware config from those generated through nixos-generate-config.
    ./network.nix # network configurations.
    ./packages.nix # Define packages
    ./security.nix # Define security configurations
    ./services.nix # Define needed Services
    ./gdm.nix # Config for Display manager & Desktop manager
    ./system.nix # System configurations
    ./user.nix # User configurations & home-manager initialization
    ./xserver.nix # xserver configurations

    inputs.stylix.nixModules.stylix
    ./stylix.nix

    # NOTE: Some packages that can be configured without home manager,
    # are configured with nix.
    ./home/fish.nix
  ];
}
