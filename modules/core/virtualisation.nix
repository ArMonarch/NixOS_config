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
    };
  };

  # Add user to libvirtd group
  users.users.${host}.extraGroups = ["libvirtd"];
}
