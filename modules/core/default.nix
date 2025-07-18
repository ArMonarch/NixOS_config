_: let
  # Import the host-specific variables.nix
  # vars = import ../../hosts/frenzfries/variables.nix;
in {
  imports = [
    ./boot.nix # boot configurations (packages, services, etc)
    ./boot-loader.nix # grub boot-loader config and themes
    # ./fonts.nix # fonts packages
    ./hardware.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./xserver.nix
  ];
}
