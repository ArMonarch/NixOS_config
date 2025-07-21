{pkgs, ...}: let
  inherit (import ../../profiles/legion/variables.nix) stylixImage;
in {
  stylix = {
    enable = true;

    # TODO: Combine these two base16-schemes
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/snazzy.yaml";
    # How to generate base16-schemes form image exactly as done by stylix.
    image = stylixImage;

    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };
}
