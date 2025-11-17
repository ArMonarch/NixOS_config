{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    cmatrix # Matrix Movie Effect In Terminal
    fastfetch # System information tool
    # flameshot # powerful & simple screenshot software
    font-manager # font viewer
    lazygit # Terminal UI for git
    nyaa # TUI app for searching anime torrents.
    qbittorrent # Aye Aye Captain
    zed-editor # Collaboration IDE
    rhythmbox # music player I love to use.
    vlc # Media Player
  ];
}
