{
  pkgs,
  lib,
  ...
}: let
  themes = pkgs.callPackage ./theme.nix {};
in {
  environment.systemPackages = [
    themes.frenzfries_demon
  ];

  services.displayManager = {
    sddm.enable = true;
    sddm.package = lib.mkDefault pkgs.kdePackages.sddm;
    sddm.extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
      kdePackages.qtwayland
    ];

    sddm.theme = "frenzfries_demon";

    sddm.wayland.enable = true;
    sddm.wayland.compositor = "kwin";

    sddm.autoNumlock = true;
    sddm.enableHidpi = true;

    sddm.settings.General.DisplayServer = "wayland";
  };
}
