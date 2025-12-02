{
  host,
  pkgs,
  ...
}: {
  imports = [./flameshot.nix];

  programs.frenzfries = {
    flameshot.enable = true;
    flameshot.package = pkgs.flameshot;
    flameshot.plasma.shortcuts = {
      enable = true;
      capture = "Print";
    };
    flameshot.settings = {
      General = {
        buttons = ''@Variant(\0\0\0\x7f\0\0\0\vQList<int>\0\0\0\0\x4\0\0\0\n\0\0\0\v\0\0\0\x17\0\0\0\f)'';
        filenamePattern = "%F_%H-%M%S";
        jpegQuality = 80;
        savePath = "/home/${host}/Pictures/Screenshots";
      };
    };
  };
}
