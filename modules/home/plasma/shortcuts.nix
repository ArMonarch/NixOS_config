{
  config,
  lib,
  ...
}: let
  cfg = config.plasma.shortcuts;
  ghostty = config.programs.frenzfries.ghostty;
  inherit (import ../lib/default.nix {}) plasma_ini;
in {
  imports = [../ghostty/ghostty.nix];

  options.plasma.shortcuts = {
    enable = lib.mkEnableOption "KDE Plasma Keymaps";
    entry = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
    };
  };

  config = lib.mkIf cfg.enable {
    plasma.shortcuts = lib.mkIf (ghostty.enable && ghostty.plasma.shortcuts.enable) {
      entry = lib.mkAfter [
        ''
          [services][com.mitchellh.ghostty.desktop]
          _launch=${ghostty.plasma.shortcuts.launch}
          new-window=${ghostty.plasma.shortcuts.new-window}
        ''
      ];
    };

    xdg.configFile = {
      "kglobalshortcutsrc" = lib.mkIf (cfg.entry != []) {
        text = lib.concatStringsSep "\n" cfg.entry;
      };

      "testrc" = lib.mkIf (cfg.entry != []) {
        text = plasma_ini cfg.entry;
      };
    };
  };
}
