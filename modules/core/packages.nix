{pkgs, ...}: {
  programs = {
    firefox.enable = true;
    dconf.enable = true;
    # NOTE: Disable Gnome Email client,
    # Browser is engough for those
    geary.enable = false;
    seahorse.enable = true;
    # PERF: Gibrish printfor command-not-found in  fish,
    # fixed by disabling command-not-found.
    command-not-found.enable = false;
  };

  nixpkgs.config.allowUnfree = true;
  environment.defaultPackages = with pkgs; [
    brightnessctl # For Screen Brightness Control
    cmatrix # Matrix Movie Effect In Terminal
    cowsay # Great Fun Terminal Program
    eza # Beautiful ls Replacement
    fd # best alternative for find
    ffmpeg # Terminal Video / Audio Editing
    fzf # Command line fuzzy finder
    ghostty # Great Terminal Emulator
    git # version manager
    htop # Simple Terminal Based System Monitor
    hyprpicker # Color Picker
    killall # For Killing All Instances Of Programs
    lazygit # Terminal UI for git
    libnotify # For Notifications
    lolcat # Add Colors To Your Terminal Command Output
    lshw # Detailed Hardware Information
    ncdu # Disk Usage Analyzer With Ncurses Interface
    nerd-fonts.fira-code # Nerd Font fira-code
    nerd-fonts.jetbrains-mono # Nerd Font jetbrains-mono
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    rhythmbox # Goto Music Listening App until I make one
    ripgrep # Improved Grep
    scrcpy # Display & Control Android Device
    socat # Needed For Screenshots
    tldr # what man page wish it could be
    qbittorrent # Aye Aye Captain
    v4l-utils # Used For Things Like OBS Virtual Camera
    wget # Tool For Fetching Files With Links
    wl-clipboard # Clipboard helper for wayland
    vscode # Noo VsCode
  ];
}
