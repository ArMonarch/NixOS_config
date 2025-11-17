{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.programs.frenzfries.flameshot;
  iniFormat = pkgs.formats.ini {};
  iniFile = iniFormat.generate "flameshot.ini" cfg.config;
in {
  options.programs.frenzfries.flameshot = {
    enable = lib.mkEnableOption "Flameshot";

    package = lib.mkPackageOption pkgs "flameshot" {};

    config = lib.mkOption {
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
  };

  config = lib.mkIf cfg.enable {
    home.packages = [cfg.package];

    xdg.configFile = lib.mkIf (cfg.config != {}) {
      "flameshot/flameshot.ini".source = iniFile;
    };
  };
}
