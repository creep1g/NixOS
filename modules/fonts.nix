# modules/fonts.nix
# /home/gilli/.local/share/OhSoManyFonts/usr/share/fonts
{ config, pkgs, ... }:

let
  # Fetch your GitHub repo with fonts
  fontRepo = /home/gilli/.local/share/OhSoManyFonts/usr/share/fonts

  # Package that installs fonts to Nix store
  myFonts = pkgs.runCommand "my-fonts" {} ''
    mkdir -p $out/share/fonts/truetype/myfonts
    cp ${fontRepo}/* $out/share/fonts/
  '';
in
{
  # Add fonts system-wide
  fonts.fonts = with pkgs; [
    dejavu_fonts
    liberation_ttf
    myFonts
  ];
}
