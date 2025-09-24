{ config, lib, pkgs, inputs, ... }:

# This is a NixOS/Home Manager module to install Doom Emacs.
# It uses the nix-doom-emacs-unstraightened project for declarative setup.
let
  inherit (lib) mkOption types;
  cfg = config.programs.doom-emacs;

  # Get the doom-emacs package from the unstraightened flake.
  # We make it a function so we can pass it the user's specific doomDir.
  doomEmacsPackage = pkgs.callPackage
    (inputs.nix-doom-emacs-unstraightened.overlays.default.doomEmacs)
    {
      doomDir = cfg.doomDir;
      emacs = cfg.package;
    };

in
{
  # Define the module options that the user can configure.
  options.programs.doom-emacs = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Doom Emacs installation via a declarative Nix module.";
    };

    doomDir = mkOption {
      type = types.path;
      description = "Path to your Doom Emacs private config directory (DOOMDIR).";
    };

    package = mkOption {
      type = types.package;
      default = pkgs.emacs;
      description = "The Emacs package to use. E.g., pkgs.emacs-pgtk.";
    };
  };

  # Apply the configuration if the module is enabled.
  config = lib.mkIf cfg.enable {
    # Add Doom Emacs to the user's home-managed packages.
    home.packages = [
      doomEmacsPackage
    ];

    # Add any required dependencies for Doom Emacs here.
    # The 'doom' executable will check for these, so it's good to install them
    # declaratively via Nix.
    home.packages = with pkgs; [
      ripgrep
      fd
      git
      gnutls # For networking features
    ];
  };
}

