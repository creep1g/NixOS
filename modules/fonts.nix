# modules/fonts.nix
# /home/gilli/.local/share/OhSoManyFonts/usr/share/fonts
{ config, pkgs, ... }:

let
  # Fetch your GitHub repo with fonts
  fontRepo = pkgs.fetchFromGitHub {
	owner = "creep1g";
	repo = "OhSoManyFonts";
	rev = "803e0bf21d421b5d5f372493585a212c0c227bc4";
	sha256 = "0000000000000000000000000000000000000000000000000000";
	};
  # Package that installs fonts to Nix store
  myFonts = pkgs.runCommand "my-fonts" {} ''
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
