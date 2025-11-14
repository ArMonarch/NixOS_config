{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-monochrome-emoji
      roboto
      roboto-mono
    ];
  };
}
