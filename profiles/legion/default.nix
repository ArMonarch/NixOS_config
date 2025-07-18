{...}: let
  inherit (import ../../hosts/frenzfries/variables.nix) intelID nvidiaID;
in {
  imports = [
    ../../hosts/frenzfries
    ../../modules/drivers
    ../../modules/core
  ];
}
