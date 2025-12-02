{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.programs.frenzfries.flameshot;
  iniFormat = pkgs.formats.ini {};
  iniFile = iniFormat.generate "flameshot.ini" cfg.settings;
in {
  options.programs.frenzfries.flameshot = {
    enable = lib.mkEnableOption "Flameshot";
    package = lib.mkPackageOption pkgs "flameshot" {};
    settings = lib.mkOption {
      inherit (iniFormat) type;
      default = {};
      example = {
        General = {
          disableTrayIcon = true;
          showStartupLaunchMessage = false;
        };
      };
      description = ''
        Configuration to use for Flameshot. See
        <https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini>
        for available options.
      '';
    };
    plasma.shortcuts = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "flameshot plasma shortcut intergration";
          launch = lib.mkOption {
            type = lib.types.str;
            default = "none";
          };
          launcher = lib.mkOption {
            type = lib.types.str;
            default = "none";
          };
          capture = lib.mkOption {
            type = lib.types.str;
            default = "none";
          };
          configure = lib.mkOption {
            type = lib.types.str;
            default = "none";
          };
        };
      };
      default = {};
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.optionals (cfg.package != {}) [cfg.package];

    xdg.configFile = lib.mkIf (cfg.settings != {}) {
      "flameshot/flameshot.ini".source = iniFile;
    };
  };
}
