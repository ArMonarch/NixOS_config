{pkgs, ...}: {
  programs.nh = {
    enable = true;
    clean = {
      enable = false;
    };
    flake = "/home/frenzfries/Dev/NixOS_config";
  };

  environment.systemPackages = with pkgs; [nix-output-monitor nvd];
}
