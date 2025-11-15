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
      gnome.enable = true;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    image = stylixImage;

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrainsMono Mono";
      };

      sansSerif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
      };

      serif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
      };

      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };

    polarity = "dark";
  };
}
