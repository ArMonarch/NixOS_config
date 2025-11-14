_: {
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    extraOptions = [
      "--group-directories-first"
      "--header" # Show header row
      "--hyperlink" # make paths clickable in some terminals
    ];
  };

  # NOTE:
  # Both shellAliases and shellAbbrs set through fish
  programs.fish = {
    shellAbbrs = {
      tree = "eza --tree";
    };
    shellAliases = {
      ls = "eza";
      lt = "eza --tree --level=2";
      ll = "eza  -lh --no-user --long";
      la = "eza -lah";
    };
  };
}
