{
  config,
  lib,
  ...
}: let
  cfg = config.plasma.keymaps;
in {
  imports = [../ghostty/ghostty.nix];

  options.plasma.keymaps = {
    enable = lib.mkEnableOption "KDE Plasma Keymaps";
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
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
    ]
  );
}
