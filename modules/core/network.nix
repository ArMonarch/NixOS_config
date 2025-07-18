{pkgs, ...}: {
  networking = {
    hostName = "frenzfries_legion-NixOS"; # Define your hostName.
    networkmanager.enable = true; # Enable networking
  };

  environment.systemPackages = with pkgs; [networkmanagerapplet];
}
