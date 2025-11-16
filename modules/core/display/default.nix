{
  pkgs,
  lib,
  ...
}: {
  services.desktopManager.plasma6.enable = true;

  imports = [
    ./sddm
    ./plasma.nix
  ];
}
