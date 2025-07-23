{pkgs, ...}: let
  fish-done-rev = "0bfe402753681f705a482694fcaf20c2bfc6deb7";
  fish-fzf-rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
in {
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    generateCompletions = true;
    plugins = [
      # TODO: Currently not working due too a bug, for Wayland & Gnome 48+
      {
        name = "Fish Done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "${fish-done-rev}";
          hash = "sha256-WA6DBrPBuXRIloO05UBunTJ9N01d6tO1K1uqojjO0mo=";
        };
      }
      {
        name = "Fish_fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "${fish-fzf-rev}";
          hash = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
        };
      }
    ];
    shellAbbrs = {
      "gb" = "git branch";
      "gc" = "git checkout";
      "gp" = "git pull";
      "gP" = "git push";
      "gs" = "git status";
      "gdf" = "git diff";
    };
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      # Set the github access key file name
      "git-pass" = "cat /home/frenzfries/Dev/Github_Access";
      "gh-pass" = "wl-copy --paste-once $(git-pass)";
      # FOOS-friendly git aliases
      br = "git branch --sort=-committerdate";
      com = "git commit -a";
      gs = "git stash";
      lg = "git log --graph --pretty=format:'%Cred%h%Creset - %C(yellow)%d%Creset %s %C(green)(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit";
    };
  };
}
