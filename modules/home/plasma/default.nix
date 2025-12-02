_: {
  imports = [./shortcuts.nix];

  plasma.shortcuts.enable = true;
  plasma.shortcuts.entry = [
    ''
      [ActivityManager]
      _k_friendly_name=Activity Manager
    ''
    ''
      [kwin]
      _k_friendly_name=kwin
      Window Maximize=Ctrl+Meta+Up,none,Maximize Window
      Window Minimize=Ctrl+Meta+Down,none,Minimize Window
      Window Close=Alt+F4,none,Close Window
    ''
  ];
}
