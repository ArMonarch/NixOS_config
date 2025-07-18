{pkgs, ...}: let
  username = "frenzfries";
in {
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "Frenzfries";
    # description = "Alice Q. User";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  nix.settings.allowed-users = ["${username}"];
}
