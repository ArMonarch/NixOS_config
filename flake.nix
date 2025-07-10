{
  description = "ArMonarch's NixOS Configuration flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {

      nixosConfigurations = {

        frenzfries = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            # Import the previous configuration.nix we used,
            # so the old configuration file still takes effect
            ./frenzfries/configuration.nix
          ];
        };

        legion = nixpkgs.lib.nixosSystem {
          modules = [
            {
              _module.args = { inherit inputs; };
            }
            ./legion/configuration.nix
            { nixpkgs.config.cudaSupport = true; }
          ];
        };

      };
    };
}
