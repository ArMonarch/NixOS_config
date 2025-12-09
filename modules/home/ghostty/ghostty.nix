{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.programs.frenzfries.ghostty;
  keyValueSettings = {
    listsAsDuplicateKeys = true;
    mkKeyValue = lib.generators.mkKeyValueDefault { } "=";
  };
  keyValue = pkgs.formats.keyValue keyValueSettings;
in
{
  options.programs.frenzfries.ghostty = {
    enable = lib.mkEnableOption "Ghostty";
    package = lib.mkPackageOption pkgs "ghostty" { };

    config = lib.mkOption {
      inherit (keyValue) type;
      default = { };
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

    systemd = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "the Ghostty systemd user service";
        };
      };
      default = { };
      description = ''
        Configuration for Ghostty's systemd integration.
        This enables additional speed and features.

        See <https://ghostty.org/docs/linux/systemd> for more information.
      '';
    };

    plasma.shortcuts = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "Ghostty plasma shortcut intergration";
          launch = lib.mkOption {
            type = lib.types.str;
            default = "none";
          };
          new-window = lib.mkOption {
            type = lib.types.str;
            default = "none";
          };
        };
      };
      default = { };
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        home.packages = lib.optionals (cfg.package != { }) [ cfg.package ];
        xdg.configFile = {
          "ghostty/config" = lib.mkIf (cfg.config != { }) {
            source = keyValue.generate "ghostty-config" cfg.config;
          };
        };
      }

      # systemd integration
      (lib.mkIf cfg.systemd.enable {
        assertions = [
          {
            assertion = cfg.systemd.enable -> (cfg.package != null);
            message = "programs.frenzfries.ghostty.systemd.enable cannot be true when programs.frenzfries.ghostty.package is null";
          }
          {
            assertion = cfg.systemd.enable -> pkgs.stdenv.hostPlatform.isLinux;
            message = "Ghostty systemd integration cannot be enabled for non-linux platforms";
          }
        ];

        xdg.configFile."systemd/user/app-com.mitchellh.ghostty.service".source =
          "${cfg.package}/share/systemd/user/app-com.mitchellh.ghostty.service";
        dbus.packages = [ cfg.package ];
      })
    ]
  );
}
