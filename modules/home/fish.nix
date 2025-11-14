{pkgs, ...}: let
  fish-done-rev = "0bfe402753681f705a482694fcaf20c2bfc6deb7";
  fish-fzf-rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
in {
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    generateCompletions = true;
    plugins = [
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
    shellAbbrs = {};
    shellAliases = {
      ".." = "cd ..";
      # Set the github access key file name
      "git-pass" = "cat /home/frenzfries/Dev/Github_Access";
      "gh-pass" = "wl-copy --paste-once $(git-pass)";
    };
  };
}
