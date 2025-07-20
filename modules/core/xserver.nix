{...}: let
  inherit (import ../../hosts/legion/variables.nix) keyboardLayout;
in {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    xkb.layout = "${keyboardLayout}";
    xkb.variant = "";
  };
}
