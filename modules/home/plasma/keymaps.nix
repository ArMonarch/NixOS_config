{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.frenzfries.plasma.keymaps;
in {
  options.frenzfries.plasma.keymaps = {
    enable = lib.mkEnableOption "KDE Plasma Keymaps";

    # GlobalShortcuts = lib.mkOption {
    #   type = lib.types.submodule {
    #     options = {
    #       WindowMaximize = lib.mkOption {
    #         type = lib.types.str;
    #         default = "Meta+";
    #       };
    #       WindowMinimize = lib.mkOption {};
    #     };
    #   };
    #   default = {};
    # };

    GlobalShortcuts = {
      WindowMaximize = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "Keybinding for Window Maximize";
        example = "Meta+PgUp";
      };
      WindowMinimize = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "Keybinding for Window Minimize";
        example = "Meta+PgDown";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "kglobalshortcutsrc".text = '''';
    };
  };
}
