{
  pkgs,
  lib,
  ...
}: {
  imports = [./keymaps.nix];

  kde.plasma.keymaps.enable = true;
}
