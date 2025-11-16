{stdenv, ...}: {
  frenzfries_breeze = stdenv.mkDerivation (finalAttrs: {
    pname = "frenzfries_breeze";
    version = "0.1.4";

    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/frenzfries_breeze
    '';

    src = ./frenzfries_breeze;
  });

  frenzfries_demon = stdenv.mkDerivation (finalAttrs: {
    pname = "frenzfries_demon";
    version = "0.1.3";

    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/frenzfries_demon
    '';

    src = ./frenzfries_demon;
  });
}
