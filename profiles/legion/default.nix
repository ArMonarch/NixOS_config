_: {
  imports = [
    ./hardware.nix # Define the result of the hardware scan.
    ../../modules/drivers/nvidia.nix # Define those S**t Nvidia drivers, that are almost always the problems.
    ../../modules/core # Define core moudules configurations.
  ];
}
