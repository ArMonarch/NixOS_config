{pkgs, ...}: {
  programs = {
    firefox.enable = true;
    # PERF: Gibrish print for command-not-found in fish,
    # fixed by disabling command-not-found.
    command-not-found.enable = false;
  };

  programs = {
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [libxcrypt-legacy];
  };

  programs.obs-studio = {
    enable = false;
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      obs-vkcapture
      obs-source-clone
      obs-move-transition
      obs-composite-blur
      obs-backgroundremoval
    ];
  };

  programs.fish.enable = true;

  # Enable Unfree & Broken software.
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  environment.defaultPackages = with pkgs; [
    fd # best alternative for find
    fzf # Command line fuzzy finder
    git # version manager, Configured through home-manager
    htop # Simple Terminal Based System Monitor
    killall # For Killing All Instances Of Programs
    libnotify # For Notifications
    nerd-fonts.fira-code # Nerd Font fira-code
    nerd-fonts.jetbrains-mono # Nerd Font jetbrains-mono
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    ripgrep # Improved Grep
    scrcpy # Display & Control Android Device
    tldr # what man page wish it could be
    postgresql_16 # Postgres database
    v4l-utils # Used For Things Like OBS Virtual Camera
    wget # Tool For Fetching Files With Links
    wl-clipboard # Clipboard helper for wayland
  ];
}
