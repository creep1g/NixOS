{ pkgs, config, ... }:
{
  swaylock-fancy = pkgs.swaylock-fancy.overrideAttrs (old: {
    postPatch = ''
      substituteInPlace ${old}/bin/fancy-lock \
        --replace "convert" "magick convert"
    '';
  });
}
