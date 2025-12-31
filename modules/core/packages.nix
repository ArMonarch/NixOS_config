{
  pkgs,
  lib,
  nixify-pkgs,
  ...
}:
{
  programs = {
    firefox.enable = true;
    command-not-found.enable = false;
  };

  programs = {
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [ libxcrypt-legacy ];
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

  environment.systemPackages =
    with pkgs;
    [
      htop # Simple Terminal Based System Monitor
      git # version manager, Configured through home-manager
      killall # For Killing All Instances Of Programs
      pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
      ripgrep # Improved Grep
      tldr # what man page wish it could be
      wget # Tool For Fetching Files With Links
    ];

  environment.defaultPackages = with pkgs; [
    fd # best alternative for find
    fzf # Command line fuzzy finder
    libnotify # For Notifications
    nerd-fonts.fira-code # Nerd Font fira-code
    nerd-fonts.jetbrains-mono # Nerd Font jetbrains-mono
    scrcpy # Display & Control Android Device
    postgresql_16 # Postgres database
    wl-clipboard # Clipboard helper for wayland
  ];
}
