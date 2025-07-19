{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    discord
    # obs-studio
  ];

  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };
  };
}
