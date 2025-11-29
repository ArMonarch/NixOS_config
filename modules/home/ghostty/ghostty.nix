{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.frenzfries.ghostty;
  keyValueSettings = {
    listsAsDuplicateKeys = true;
    mkKeyValue = lib.generators.mkKeyValueDefault {} "=";
  };
  keyValue = pkgs.formats.keyValue keyValueSettings;
in {
  options.programs.frenzfries.ghostty = {
    enable = lib.mkEnableOption "Ghostty";
    package = lib.mkPackageOption pkgs "ghostty" {};
    config = lib.mkOption {
      inherit (keyValue) type;
      default = {};
      example = lib.literalExpression ''
        {
          theme = "catppuccin-mocha";
          font-size = 10;
          keybind = [
            "ctrl+h=goto_split:left"
            "ctrl+l=goto_split:right"
          ];
        }
      '';
      description = ''
        Configuration written to {file}`$XDG_CONFIG_HOME/ghostty/config`.

        See <https://ghostty.org/docs/config/reference> for more information.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.optionals (cfg.package != {}) [cfg.package];
    xdg.configFile = let
    in {
      "ghostty/config" = lib.mkIf (cfg.config != {}) {
        source = keyValue.generate "ghostty-config" cfg.config;
      };
    };
  };

  # xdg.configFile."systemd/user/app-com.mitchellh.ghostty.service".source = "${config.programs.frenzfries.ghostty.package}/share/systemd/user/app-com.mitchellh.ghostty.service";
  # dbus.packages = [config.programs.frenzfries.ghostty.package];
}
