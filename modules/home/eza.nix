_: {
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    enableBashIntegration = false;
    enableFishIntegration = true;
    enableZshIntegration = false;

    extraOptions = [
      "--group-directories-first"
      "--header" # Show header row
      "--hyperlink" # make paths clickable in some terminals
    ];
  };

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
