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
      # NOTE: The 'frenzfries' profile serves as the default NixOS configuration.
      # It provides a reliable, self-contained setup defined in ./hosts/frenzfries/default.nix,
      # with no external dependencies. This profile is based on the initial configuration
      # generated by `nixos-generate-config`.
      #
      # IMPORTANT: To ensure correct hardware support, always replace
      # ./hosts/frenzfries/hardware.nix with the latest output from `nixos-generate-config`.
      #
      # This profile acts as a fallback: if any other configuration fails, 'frenzfries' is
      # our stable, working baseline.
      frenzfries = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit host;
          inherit nixpkgs;
          inherit nixpkgs-unstable;
          inherit inputs;
        };
        modules = [
          ./profiles/frenzfries
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
          ./profiles/legion
        ];
      };
    };
  };
}
