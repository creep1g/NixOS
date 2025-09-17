# modules/fonts.nix
# /home/gilli/.local/share/OhSoManyFonts/usr/share/fonts
{ config, pkgs, ... }:

let
  # Fetch your GitHub repo with fonts
  fontRepo = pkgs.fetchFromGitHub {
    owner = "creep1g";       # replace with your GitHub username
    repo = "OhSoManyFonts";           # replace with your repo name
    rev = "main";             # or pin to a commit hash
    sha256 = "0000000000000000000000000000000000000000000000000000"; # replace with correct hash
  };

  # Package that installs fonts to Nix store
  myFonts = pkgs.runCommand "my-fonts" {} ''
    mkdir -p $out/share/fonts/truetype/myfonts
    cp ${fontRepo}/monolisa-font/fonts/web/*.woff2 $out/share/fonts/
  '';
in

{
  fonts.packages = with pkgs; [
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    nerd-fonts.hack
    inter
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.liberation
    myFonts
  ];
}
