{pkgs, ...}: let
  inherit (import ../../profiles/legion/variables.nix) stylixImage;
in {
  stylix = {
    enable = true;

    # TODO: Combine these two base16-schemes
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/snazzy.yaml";
    # How to generate base16-schemes form image exactly as done by stylix.

    # Image base16Scheme:
    # base16Scheme = {
    #   "base00" = "1a1c1b";
    #   "base01" = "3f484d";
    #   "base02" = "656b69";
    #   "base03" = "c78f8e";
    #   "base04" = "c1b8a9";
    #   "base05" = "cee7ee";
    #   "base06" = "ecf4e5";
    #   "base07" = "ffe9f9";
    #   "base08" = "968ca5";
    #   "base09" = "c1807e";
    #   "base0A" = "b18970";
    #   "base0B" = "fa5f48";
    #   "base0C" = "899484";
    #   "base0D" = "659e97";
    #   "base0E" = "9f8c90";
    #   "base0F" = "7793ab";
    # };

    # Snazzy base16Scheme
    base16Scheme = {
      "base00" = "282a36";
      "base01" = "34353e";
      "base02" = "43454f";
      "base03" = "78787e";
      "base04" = "a5a5a9";
      "base05" = "e2e4e5";
      "base06" = "eff0eb";
      "base07" = "f1f1f0";
      "base08" = "ff5c57";
      "base09" = "ff9f43";
      "base0A" = "f3f99d";
      "base0B" = "5af78e";
      "base0C" = "9aedfe";
      "base0D" = "57c7ff";
      "base0E" = "ff6ac1";
      "base0F" = "b2643c";
    };

    image = stylixImage;

    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NF";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    # fonts.sizes = {
    #   applications = 10;
    #   terminal = 15;
    #   desktop = 10;
    #   popups = 10;
    # };
  };
}
