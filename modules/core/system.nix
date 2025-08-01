{pkgs, ...}: {
  nix = {
    settings = {
      # Enable linking(hard link) insted of copying identical files / packages.
      auto-optimise-store = true;
      # Enable Experimental Nix Flakes Support.
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  environment.shells = [
    pkgs.fish
  ];
  programs.fish.enable = true;

  # TODO: Import TimeZone through the variables.nix
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";
}
