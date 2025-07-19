{...}: {
  # Services
  services = {
    libinput.enable = true; # Input Handeling
    fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/Video preview
    gnome.gnome-keyring.enable = true; # Gnome security credential daemon

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable Sound with Pipewire
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
