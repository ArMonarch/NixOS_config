{pkgs, ...}: {
  programs = {
    firefox.enable = true;
    dconf.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.defaultPackages = with pkgs; [
    appimage-run # Needed For AppImage Support
    cmatrix # Matrix Movie Effect In Terminal
    cowsay # Great Fun Terminal Program
    ghostty # Great Terminal Emulator
    git # version manager
    lazygit # Terminal UI for git
    rhythmbox # Goto Music Listening App until I make one
    scrcpy # Display & Control Android Device
    qbittorrent # Aye Aye Captain
    wl-clipboard # Clipboard helper for wayland
    vscode # Noo VsCode
  ];
}
