{
  pkgs,
  lib,
  ...
}: {
  environment.plasma6.excludePackages = [
    pkgs.kdePackages.elisa
    pkgs.kdePackages.kate
    pkgs.kdePackages.konsole
    pkgs.kdePackages.kwallet
    pkgs.kdePackages.kwalletmanager
  ];
}
