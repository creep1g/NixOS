# modules/fonts.nix
{ config, pkgs, ... }:

let
  # Fetch your GitHub repo with fonts
  fontRepo = pkgs.fetchFromGitHub {
    owner = "creep1g";       # replace with your GitHub username
    repo = "OhSoManyFonts";           # replace with your repo name
    rev = "803e0bf21d421b5d5f372493585a212c0c227bc4";             # or pin to a commit hash
    sha256 = "0000000000000000000000000000000000000000000000000000"; # replace with correct hash
  };

  # Package that installs fonts to Nix store
  myFonts = pkgs.runCommand "my-fonts" {} ''
    mkdir -p $out/share/fonts/truetype/myfonts
    cp ${fontRepo}/usr/share/fonts/** $out/share/fonts/
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
