{
  config,
  host,
  pkgs,
  ...
}: {
  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
  };

  # Add user to libvirtd group
  users.users.${host}.extraGroups = ["libvirtd"];
}
