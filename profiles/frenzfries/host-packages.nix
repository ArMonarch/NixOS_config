{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
    };
  };

  environment.systemPackages = with pkgs; [
    ghostty # Great Terminal Emulator
    git # version manager
    lazygit # Terminal UI for git
    nerd-fonts.jetbrains-mono # Jetbrains Mono Nerd Font
    tldr # what man page wish it could be
    wget # Tool For Fetching Files With Links
    wl-clipboard # Clipboard helper for wayland
  ];
}
