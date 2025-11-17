{
  pkgs,
  lib,
  ...
}: {
  environment.plasma6.excludePackages = [
    pkgs.kdePackages.elisa
    pkgs.kdePackages.kate
    pkgs.kdePackages.kwallet
    pkgs.kdePackages.kwalletmanager
    pkgs.kdePackages.spectacle
  ];
}
