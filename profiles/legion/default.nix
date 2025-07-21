_: {
  imports = [
    ./hardware.nix # Define the result of the hardware scan.
    ./host-packages.nix # Define some needed packages, others will be added through packages.nix.
    ../../modules/drivers # Define those S**t Nvidia drivers, that are almost always the problems.
    ../../modules/core # Define core moudules configurations.
  ];
}
