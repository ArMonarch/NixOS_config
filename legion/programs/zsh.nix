{pkgs, ...}: {
  programs.zsh = {
    enable = false;
    enableCompletion = true;
    autosuggestions.enable = true;

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "regexp" "root" "line"];
    };

    histFile = "$HOME/.zsh_history";
    histSize = 2000;

    ohMyZsh.enable = false;
    ohMyZsh.theme = "robbyrussell";

    ohMyZsh.plugins = ["git" "man" "python"];
  };

  environment.shells = [
    pkgs.zsh
  ];
  environment.shellAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    # Set the github access key file name
    "git-pass" = "cat /home/frenzfries/Dev/Github_Access";
    "gh-pass" = "wl-copy --paste-once $(git-pass)";
  };
  users.defaultUserShell = pkgs.zsh;
}
