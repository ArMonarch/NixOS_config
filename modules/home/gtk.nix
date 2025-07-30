{
  pkgs,
  lib,
  ...
}: {
  gtk = {
    enable = true;

    font = {
      name = lib.mkForce "Adwaita Sans";
      size = lib.mkForce 11;
      package = lib.mkForce pkgs.adwaita-fonts;
    };

    theme = {
      name = lib.mkForce "rose-pine-gtk";
      package = lib.mkForce pkgs.rose-pine-gtk-theme;
    };

    # TODO: Icon Theme
    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
