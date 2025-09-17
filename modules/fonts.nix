# modules/fonts.nix
{ config, pkgs, ... }:

let
  # Fetch your GitHub repo with fonts
  fontRepo = pkgs.fetchFromGitHub {
    owner = "creep1g";       # replace with your GitHub username
    repo = "OhSoManyFonts";           # replace with your repo name
    rev = "main";             # or pin to a commit hash
    #sha256 = "0000000000000000000000000000000000000000000000000000"; # replace with correct hash
  };

  # Package that installs fonts to Nix store
  myFonts = pkgs.runCommand "my-fonts" {} ''
    mkdir -p $out/share/fonts/truetype/myfonts
    cp ${fontRepo}/*.ttf $out/share/fonts/truetype/myfonts/
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
