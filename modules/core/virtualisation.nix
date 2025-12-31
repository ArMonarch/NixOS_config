{
  host,
  pkgs,
  ...
}: {
  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;

  # Add user to libvirtd group
  users.users.${host}.extraGroups = ["libvirtd"];
}
