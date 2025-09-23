{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jxplorer
    ];

	pkgs.writeShellScriptBin "jxplorer-wrapped" ''
  	    exec ${pkgs.jxplorer}/bin/jxplorer -Djxplorer.config=/path/to/desired/dir "$@"
	'';
}
