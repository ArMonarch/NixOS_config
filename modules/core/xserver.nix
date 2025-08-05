{...}: let
  inherit (import ../../profiles/legion/variables.nix) keyboardLayout consoleKeyMap;
in {
  services.xserver = {
    # Disable the X11 windowing system, and use Wayland Explicityly
    enable = true;

    xkb.layout = "${keyboardLayout}";
    xkb.variant = "";
  };
  console.keyMap = "${consoleKeyMap}"; # NOTE: Needed ?
}
