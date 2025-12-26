{ pkgs, host, ... }:
{
  nixify.users.${host} = {
    packages = with pkgs; [ vim ];
    imports = [ ];
  };
}
