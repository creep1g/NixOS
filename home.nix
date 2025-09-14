{ pkgs, dotfiles, ... }:

{
	home.username = "gilli";
	home.homeDirectory = "/home/gilli";
	
	program.fish.enable = true;
	
	# Link dotfiles!
	
	home.file = {
		".config/hypr".source = "${dotfiles}/.config/hypr";
		".config/waybar".source = "${dotfiles}/.config/waybar";
		".config/kitty/kitty.conf".source = "${dotfiles}/.config/kitty/kitty.conf";
		".config/fish".source = "${dotfiles}/.config/fish";
		".config/nvim".source = "${dotfiles}/.config/nvim";
		".config/qutebrowser".source = "${dotfiles}/.config/qutebrowser";
		".config/rofi".source = "${dotfiles}/.config/rofi";
		".config/dunst".source = "${dotfiles}/.config/dunst";
		".config/wal".source = "${dotfiles}/.config/wal";
		"Wallpapers".source = "${dotfiles}Wallpapers";
	};
	
	
	home.stateVersion = "25.05";
}
