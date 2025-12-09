{
  config,
  lib,
  ...
}:
let
  cfg = config.plasma.shortcuts;
  ghostty = config.programs.frenzfries.ghostty;
  flameshot = config.programs.frenzfries.flameshot;
  inherit (import ../lib/default.nix { }) plasma_ini;
in
{
  imports = [
    ../ghostty/ghostty.nix
    ../flameshot/flameshot.nix
  ];

  options.plasma.shortcuts = {
    enable = lib.mkEnableOption "KDE Plasma Keymaps";
    entry = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    plasma.shortcuts = lib.mkMerge [
      (lib.mkIf (ghostty.enable && ghostty.plasma.shortcuts.enable) {
        entry = lib.mkAfter [
          ''
            [services][com.mitchellh.ghostty.desktop]
            _launch=${ghostty.plasma.shortcuts.launch}
            new-window=${ghostty.plasma.shortcuts.new-window}
          ''
        ];
      })

      (lib.mkIf (flameshot.enable && flameshot.plasma.shortcuts.enable) {
        entry = lib.mkAfter [
          ''
            [services][org.flameshot.Flameshot.desktop]
            _launch=${flameshot.plasma.shortcuts.launch}
            Configure=${flameshot.plasma.shortcuts.configure}
            Capture=${flameshot.plasma.shortcuts.capture}
            Launcher=${flameshot.plasma.shortcuts.launcher}
          ''
        ];
      })
      {
        entry = lib.mkAfter [
          ''
            [services][org.kde.spectacle.desktop]
            _launch=none
            ActiveWindowScreenShot=Alt+Print
            CurrentMonitorScreenShot=none
            FullScreenScreenShot=Meta+Print
            OpenWithoutScreenshot=none
            RecordRegion=none
            RecordScreen=Ctrl+Alt+R
            RecordWindow=none
            RectangularRegionScreenShot=Print
            WindowUnderCursorScreenShot=none
          ''
        ];
      }
    ];

    xdg.configFile = {
      "kglobalshortcutsrc" = lib.mkIf (cfg.entry != [ ]) {
        text = lib.concatStringsSep "\n" cfg.entry;
      };

      "testrc" = lib.mkIf (cfg.entry != [ ]) {
        text = plasma_ini cfg.entry;
      };
    };
  };
}
