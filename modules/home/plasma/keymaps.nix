{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.kde.plasma.keymaps;
  mkKeyVal = lib.mapAttrsToList (key: val: key + "=" + val);
in {
  options.kde.plasma.keymaps = {
    enable = lib.mkEnableOption "KDE Plasma Keymaps";

    flameshot.enable = lib.mkEnableOption "Flameshot Screenshot utility Keymaps";
    ghostty.enable = lib.mkEnableOption "Ghostty Keymaps";

    settings = lib.mkOption {
      type = lib.types.attrsOf (lib.types.nullOr lib.types.str);
      default = {
        "Name" = "Prafful Raj Thapa";
      };
      description = "";
      example = "";
    };
  };

  config = lib.mkMerge [
    (
      lib.mkIf cfg.enable {
        xdg.configFile = {
          "kglobalshortcutsrc".text = ''
            [ActivityManager]
            _k_friendly_name=Activity Manager

            [kwin]
            _k_friendly_name=kwin
            Window Maximize=Ctrl+Meta+Up,none,Maximize Window
            Window Minimize=Ctrl+Meta+Down,none,Minimize Window
            Window Close=Alt+F4
          '';
        };
      }
    )
    (
      lib.mkIf (cfg.settings != {}) {
        xdg.configFile = {
          "testsrc".text = lib.concatStringsSep "\n" (mkKeyVal cfg.settings);
        };
      }
    )
  ];
}
