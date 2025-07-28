{pkgs, ...}: let
  inherit (import ../../profiles/legion/variables.nix) stylixImage;
in {
  stylix = {
    enable = true;
    autoEnable = false;

    # Select stylix targets manually.
    targets = {
      console.enable = true;
      grub.enable = true;
    };

    # TODO: Combine these two base16-schemes
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    image = stylixImage;

    polarity = "either";

    fonts = {
      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
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
  };
}
