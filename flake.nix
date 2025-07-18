{
  description = "ArMonarch's NixOS Configuration flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # NixOS official package source, using the nixos-unstable branch
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    host = "frenzfries";
  in {
    nixosConfigurations = {
      frenzfries = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./frenzfries/configuration.nix
        ];
      };

      legion = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit host;
          inherit nixpkgs;
          inherit nixpkgs-unstable;
          inherit inputs;
        };
        modules = [
          ./legion/configuration.nix
        ];
      };

      legion2 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit host;
          inherit nixpkgs;
          inherit nixpkgs-unstable;
          inherit inputs;
        };
        modules = [
          ./profiles/legion
        ];
      };
    };
  };
}
