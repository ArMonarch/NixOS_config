{lib ? (import <nixpkgs> {}).lib, ...}: {
  plasma_ini = list: builtins.concatStringsSep "\n" list;
}
