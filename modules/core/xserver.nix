{...}: let
  inherit (import ../../profiles/legion/variables.nix) keyboardLayout;
in {
  services.xserver = {
    enable = true;

    xkb.layout = "${keyboardLayout}";
    xkb.variant = "";
  };
}
