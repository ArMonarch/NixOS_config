_: let
  inherit (import ../../profiles/legion/variables.nix) gitUsername gitEmail;
in {
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";

    extraConfig = {
      # FOSS-friendly settings
      push.default = "simple"; # Match modern push behavior
      credential.helper = "cache --timeout=7200";
      init.defaultBranch = "master"; # Set default new branches to 'main'
      log.decorate = "full"; # Show branch/tag info in git log
      log.date = "iso"; # ISO 8601 date format
      # Conflict resolution style for readable diffs
      merge.conflictStyle = "diff3";
    };

    aliases = {};
  };

  # Optional: FOSS-friendly Git aliases will be added through fish.nix
  programs.fish = {
    shellAbbrs = {
      gb = "git branch";
      gco = "git checkout";
      gdf = "git diff";
      gp = " git pull";
      gP = "git push";
      gs = "git status";
    };

    shellAliases = {
      br = "git branch --sort=-committerdate";
      com = "git commit -a";
      gs = "git stash";
      lg = "git log --graph --pretty=format:'%Cred%h%Creset - %C(yellow)%d%Creset %s %C(green)(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit";
    };
  };
}
