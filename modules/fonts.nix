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
		nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto-fonts-emoji
		nerd-fonts.hack
    inter
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.liberation
  ];
}
