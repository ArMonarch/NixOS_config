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

    # Optional: FOSS-friendly Git aliases will be added through fish.nix
    aliases = {};
  };
}
