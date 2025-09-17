# modules/fonts.nix
# /home/gilli/.local/share/OhSoManyFonts/usr/share/fonts
{ config, pkgs, ... }:

{
  # Add fonts system-wide
  #.systemPackages = with pkgs; [
  #  jetbrains-mono
#		noto-fonts-emoji
#		inter
#  ];

  fonts.packages = with pkgs; [
    pkgs.nerd-fents.droid
    jetbrains-mono
    noto-fonts-emoji
    inter
    dejavu_fonts
    liberation_ttf
  ];
}
