{ hostname, ... }:
{
  networking = {
    hostName = hostname; # Define your hostName.
    networkmanager.enable = true; # Enable networking
  };
}
