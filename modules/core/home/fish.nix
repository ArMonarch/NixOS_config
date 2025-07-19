{pkgs, ...}: {
  # TODO: Move environment shells to system.nix
  environment.shells = [
    pkgs.fish
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      # Set the github access key file name
      "git-pass" = "cat /home/frenzfries/Dev/Github_Access";
      "gh-pass" = "wl-copy --paste-once $(git-pass)";
    };
  };
}
