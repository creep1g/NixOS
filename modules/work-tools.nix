{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.jxplorer
    (pkgs.writeShellScriptBin "jxplorer-wrapped" ''
      cd "${pkgs.jxplorer}/opt/jxplorer"
      exec ./jxplorer.sh "-Djxplorer.config=$HOME/.local/jxplorer" "$@"
    '')
  ];
}
