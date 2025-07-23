{
  host,
  pkgs,
  inputs,
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

  # Add Home Manager
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs host;};
    users.${host} = {
      imports = [./../home/default.nix];
      home = {
        username = "${host}";
        homeDirectory = "/home/${host}";
        stateVersion = "25.05";
      };
    };
  };
}
