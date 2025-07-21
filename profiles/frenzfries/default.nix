_: {
  imports = [
    ./configuration.nix # Define the overall self-contained configuration.
    ./hardware-configuration.nix # Defines the result of hardware scan.
    ./host-packages.nix # Define needed packages
  ];
}
