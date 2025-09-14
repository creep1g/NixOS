{
	description = "NixOS + Hyprland + Dotfiles setup";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		dotfiles.url = "github:creep1g/NixOS-Dotfiles"; # Repo
	};


	outputs = { self, nixpkgs, home-manager, dotfiles, ... }: 
		let 
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; };
		in
		{
			nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				inherit system;
			
				modules = [
					./configuration.nix
					home-manager.nixosModules.home-manager
				  ({ pkgs, config, ... }: { 
          	home-manager.users.gilli = import ./home.nix { dotfiles = dotfiles; };
  				})
				];
			};
		};
}
