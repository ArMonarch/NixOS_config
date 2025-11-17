{
  host,
  inputs,
  ...
}: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs host;};
    users.${host} = {
      imports = [../home/default.nix];
      home = {
        username = "${host}";
        homeDirectory = "/home/${host}";
        stateVersion = "25.05";
      };
    };
  };
}
