{...}: let
  inherit (import ../../hosts/frenzfries/variables.nix) keyboardLayout;
in {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    xkb.layout = "${keyboardLayout}";
    xkb.variant = "";
  };
}
