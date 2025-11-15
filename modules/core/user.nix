{
  host,
  pkgs,
  ...
}: {
  users.mutableUsers = true;
  users.defaultUserShell = pkgs.fish;
  users.users.${host} = {
    isNormalUser = true;
    description = "${host}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  nix.settings.allowed-users = ["${host}"];
}
