{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      jetbrains-mono
      noto-fonts
      roboto
      roboto-mono
    ];
  };
}
