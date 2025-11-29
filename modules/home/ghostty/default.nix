{
  nixpkgs-unstable,
  system,
  ...
}: {
  imports = [
    ./ghostty.nix
  ];

  programs.frenzfries.ghostty = {
    enable = true;
    package = nixpkgs-unstable.legacyPackages.${system}.ghostty;
    config = {
      # Window Padding
      window-padding-x = 2;
      window-padding-y = 0;
      window-padding-balance = true;

      # Window Size
      window-width = 160;
      window-height = 40;

      # Window Decoration
      window-decoration = "server";

      shell-integration-features = "no-cursor, title, ssh-terminfo, ssh-env";

      # Cursor Customization
      cursor-style = "block";
      cursor-style-blink = false;
      mouse-hide-while-typing = true;

      # Configure the font family for ghostty
      font-family = "JetBrainsMono Nerd Font";
      font-size = 11.8;

      # Theme
      # Automatic dark/light switching
      theme = "light:Rose Pine Dawn, dark:Rose Pine Moon";

      # window transparency customization
      background-opacity = 0.94;
      background-blur-radius = 20;

      # Resize Configuration
      resize-overlay = "always";
      resize-overlay-position = "bottom-right";

      # Key Bindings
      keybind = [
        "ctrl+shift+|=new_split:right"
        "ctrl+shift+-=new_split:down"

        "ctrl+shift+j=goto_split:bottom"
        "ctrl+shift+k=goto_split:top"
        "ctrl+shift+h=goto_split:left"
        "ctrl+shift+l=goto_split:right"

        "ctrl+shift+n=new_window"
        "ctrl+shift+t=new_tab"

        "ctrl+q=close_surface"
        "alt+g=toggle_window_decorations"
      ];
    };
  };
}
