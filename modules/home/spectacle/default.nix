{ pkgs, ... }:
{
  imports = [ ./spectacle.nix ];

  programs.frenzfries.spectacle = {
    enable = true;
    package = pkgs.kdePackages.spectacle;
  };
}
