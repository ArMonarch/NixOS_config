{pkgs, ...}: {
  programs = {
    firefox.enable = true;
    # dconf.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.defaultPackages = with pkgs; [
    cmatrix # Matrix Movie Effect In Terminal
    cowsay # Great Fun Terminal Program
    ghostty # Great Terminal Emulator
    git # version manager
    lazygit # Terminal UI for git
    nerd-fonts.fira-code # Nerd Font fira-code
    nerd-fonts.jetbrains-mono # Nerd Font jetbrains-mono
    rhythmbox # Goto Music Listening App until I make one
    scrcpy # Display & Control Android Device
    qbittorrent # Aye Aye Captain
    wget # Tool For Fetching Files With Links
    wl-clipboard # Clipboard helper for wayland
    vscode # Noo VsCode
  ];
}
