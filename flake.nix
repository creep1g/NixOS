{
	description = "NixOS + Hyprland + Dotfiles setup";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		dotfiles.url = "github:creep1g/NixOS-Dotfiles"; # Repo
		hyprland.url = "github:hyprwm/Hyprland";
		
		hypr-contrib = {
			url = "github:hyprwm/contrib";
			inputs.nixpkgs.follows = "hyprland/nixpkgs";
		};
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
					./modules/modules.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.gilli = { ... }: {
							imports = [ ./home.nix ];
							_module.args.dotfiles = dotfiles;
						};
					}
				];
			};
		};
}
