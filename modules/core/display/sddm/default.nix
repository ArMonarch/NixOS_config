{
  pkgs,
  lib,
  ...
}: {
  services.displayManager = {
    sddm.enable = true;

    sddm.wayland.enable = true;
    sddm.wayland.compositor = "kwin";

    sddm.autoNumlock = true;
    sddm.enableHidpi = true;

    sddm.settings.General.DisplayServer = "wayland";
  };
}
