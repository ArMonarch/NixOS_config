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
  };
}
