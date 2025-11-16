{stdenv, ...}: {
  serene = stdenv.mkDerivation (finalAttrs: {
    pname = "serene";
    version = "0.1.0";

    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/serene
    '';

    src = ./serene;
  });
}
