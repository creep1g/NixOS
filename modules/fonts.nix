# modules/fonts.nix
# /home/gilli/.local/share/OhSoManyFonts/usr/share/fonts
{ config, pkgs, lib, ... }:

let
  # Fetch your GitHub repo with fonts
  fontRepo = pkgs.fetchFromGitHub {
    owner = "creep1g";       # replace with your GitHub username
    repo = "OhSoManyFonts";           # replace with your repo name
    rev = "5d5e601ab8caed950d5741c0ead7c3912148cdcd";             # or pin to a commit hash
    sha256 = "NhXcSkbLO2xvwUD2s6xvG/0Sjhd4YazQPjpVcY2oSDc="; # replace with correct hash
  };

  # Package that installs fonts to Nix store
  myFonts = pkgs.runCommand "my-fonts" {} ''
    mkdir -p $out/share/fonts/truetype/MonoLisa
    cp ${fontRepo}/monolisa-font/* $out/share/fonts/truetype/MonoLisa/
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
