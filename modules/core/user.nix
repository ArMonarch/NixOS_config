{pkgs, ...}: let
  username = "frenzfries";
in {
  users.mutableUsers = true;
  users.defaultUserShell = pkgs.fish;
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  nix.settings.allowed-users = ["${username}"];
}
