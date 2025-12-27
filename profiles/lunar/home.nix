{
  host,
  nixpkgs-unstable,
  inputs,
  system,
  ...
}:
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
      inherit host;
      inherit nixpkgs-unstable;
      inherit system;
    };
    users.${host} = {
      home = {
        username = "${host}";
        homeDirectory = "/home/${host}";
        stateVersion = "25.11";
      };
      imports = [
        ../../modules/home/eza.nix
        ../../modules/home/fish.nix
        ../../modules/home/git.nix
        ../../modules/home/gtk.nix
        ../../modules/home/packages.nix
        ../../modules/home/stylix.nix

        ../../modules/home/flameshot/default.nix
        ../../modules/home/ghostty/default.nix
        ../../modules/home/plasma/default.nix
        ../../modules/home/spectacle/default.nix
      ];
    };
  };
}
