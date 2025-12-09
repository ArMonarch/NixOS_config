{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.frenzfries.spectacle;
in
{
  options = {
    programs.frenzfries.spectacle = {
      enable = lib.mkEnableOption "Spectacle";
      package = lib.mkPackageOption pkgs "kdePackages.spectacle" { };

      plasma.shortcuts = { };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.optionals (cfg.package != { }) [ cfg.package ];
  };
}
