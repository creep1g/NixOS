{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jxplorer
        (writeShellScriptBin "jxplorer-wrapped" ''
            exec ${jxplorer}/bin/jxplorer -Djxplorer.config=/path/to/desired/dir "$@"
        '')
    ];

}
