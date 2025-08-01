{pkgs, ...}: {
  programs = {
    firefox.enable = true;
    dconf.enable = true;

    # NOTE: Disable Gnome Email client,
    # Browser is engough for those
    geary.enable = false;
    seahorse.enable = true;
    # PERF: Gibrish print for command-not-found in  fish,
    # fixed by disabling command-not-found.
    command-not-found.enable = false;
  };

  nixpkgs.config.allowUnfree = true;

  environment.defaultPackages = with pkgs; [
    cmatrix # Matrix Movie Effect In Terminal
    eza # Beautiful ls Replacement
    fastfetch # System information tool
    fd # best alternative for find
    ffmpeg # Terminal Video / Audio Editing
    fzf # Command line fuzzy finder
    git # version manager, Configured through home-manager
    gnome-tweaks # Tool for customizing Gnome 3 Options
    htop # Simple Terminal Based System Monitor
    hyprpicker # Color Picker
    killall # For Killing All Instances Of Programs
    lazygit # Terminal UI for git
    libnotify # For Notifications
    nerd-fonts.fira-code # Nerd Font fira-code
    nerd-fonts.jetbrains-mono # Nerd Font jetbrains-mono
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    ripgrep # Improved Grep
    scrcpy # Display & Control Android Device
    tldr # what man page wish it could be
    qbittorrent # Aye Aye Captain
    v4l-utils # Used For Things Like OBS Virtual Camera
    wget # Tool For Fetching Files With Links
    wl-clipboard # Clipboard helper for wayland
    vscode # Noo VsCode, But Incase Needed
  ];
}
