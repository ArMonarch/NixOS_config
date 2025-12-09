{
  host,
  nixpkgs-unstable,
  inputs,
  ...
}: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
      inherit host;
      inherit nixpkgs-unstable;
      inherit (import ../../profiles/lunar/variables.nix) system;
    };
    users.${host} = {
      imports = [
        ../home/default.nix
      ];
      home = {
        username = "${host}";
        homeDirectory = "/home/${host}";
        stateVersion = "25.05";
      };
    };
  };
}
