{pkgs, ...}: let
  themes = pkgs.callPackage ./theme.nix {};
in {
  environment.systemPackages = [
    themes.serene
  ];

  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "serene";

    sddm.wayland.enable = true;
    sddm.wayland.compositor = "kwin";

    sddm.autoNumlock = true;
    sddm.enableHidpi = true;

    sddm.settings.General.DisplayServer = "wayland";
  };
}
