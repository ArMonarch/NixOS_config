{pkgs, ...}: {
  environment.systemPackages = [];

  # NOTE: Enable Obs Studion when needed from  here
  programs.obs-studio = {
    enable = false;
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      obs-vkcapture
      obs-source-clone
      obs-move-transition
      obs-composite-blur
      obs-backgroundremoval
    ];
  };
}
