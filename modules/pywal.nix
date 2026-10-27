{ pkgs, lib, ... }:
let
  # nixpkgs' pywal16 sets makeWrapperArgs to a single string
  # ("--prefix PATH : <path>"), which the stricter makeWrapper now rejects.
  # Pass it as separate arguments instead. (pkgs.pywal is an alias of pywal16.)
  pywal16-fixed = pkgs.pywal16.overrideAttrs (_: {
    makeWrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      "${lib.makeBinPath [ pkgs.imagemagick ]}"
    ];
  });
in
{
  environment.systemPackages = [ pywal16-fixed ];
}
