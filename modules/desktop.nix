# Home Manager modules (imported from home.nix).
{ ... }:
{
  imports = [
    ./desktop/hyprland/config.nix
    ./desktop/conky.nix
  ];
}
