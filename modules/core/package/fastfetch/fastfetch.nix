{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.packages.fastfetch;
in
{
  options.packages.fastfetch = {
    enable = lib.mkEnableOption "Fastfetch";
    package = lib.mkPackageOption pkgs "fastfetchMinimal" { };
    config = lib.mkEnableOption "config";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };
}
