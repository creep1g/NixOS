{
	description = "Flakes baaabyy!!"
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
		
		# Neovim
		neovim-nightly-overlay.url = "github:nix-community/
	};

	outputs = { self, nixpkgs, neovim-nightly-overlay, ... }; {
		
		nixConfigurations."nixos" = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			
			modules = [
				# Import your main system config
				./configuration.nix
				
				neovim-nightly-overlay.olerlays.default	
			];
		};
	};
}
