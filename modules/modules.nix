# System-level (NixOS) modules. Home Manager modules live in ./desktop.nix.
{ ... }:
{
  imports = [
    ./core/bootloader.nix
    ./core/kernel.nix
    ./core/network.nix
    ./core/intel.nix
    ./keyboard.nix
    ./fonts.nix
    ./pywal.nix
    ./work-tools.nix
    ./desktop/sddm.nix
    ./desktop/input.nix
    ./desktop/teams.nix
  ];
}
