_: let
  inherit (import ../../profiles/lunar/variables.nix) hostname;
in {
  networking = {
    hostName = hostname; # Define your hostName.
    networkmanager.enable = true; # Enable networking
  };
}
