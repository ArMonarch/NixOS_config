{...}: let
  inherit (import ../../profiles/lunar/variables.nix) keyboardLayout;
in {
  services.xserver = {
    enable = true;

    xkb.layout = "${keyboardLayout}";
    xkb.variant = "";
  };
}
