{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "regexp" "root" "line"];
    };

    histFile = "$HOME/.zsh_history";
    histSize = 2000;

    # NOTE: powerlevel10k has some bugs when initialized like this
    # promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    ohMyZsh.enable = true;
    ohMyZsh.custom = "$HOME/.oh-my-zsh/custom/";
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
