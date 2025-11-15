{...}: let
  inherit (import ../../profiles/legion/variables.nix) keyboardLayout consoleKeyMap;
in {
  services.xserver = {
    enable = true;

    xkb.layout = "${keyboardLayout}";
    xkb.variant = "";
  };
}
