{
  pkgs,
  lib,
  ...
}: {
  imports = [./keymaps.nix];

  frenzfries.plasma.keymaps.enable = false;
  frenzfries.plasma.keymaps.GlobalShortcuts.WindowMaximize = "Ctrl+]";
  frenzfries.plasma.keymaps.GlobalShortcuts.WindowMinimize = "Ctrl+[";
}
