{
	description = "Joris' Flake";

	inputs = 
	{
		nixpkgs.url = "nixpkgs/nixos-25.05";
		
		home-manager = 
		{
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		stylix = 
		{
			url = "github:nix-community/stylix/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, stylix, ...}:
	let
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${system};
	in 
	{
		nixosConfigurations = 
		{
			legion = lib.nixosSystem 
			{
				inherit system;
				modules = 
				[ 
					./configuration.nix 
					stylix.nixosModules.stylix
				];
			};	
		};	

		homeConfigurations = 
		{
			joris = home-manager.lib.homeManagerConfiguration
			{
				inherit pkgs;
				modules = 
				[ 
					./home.nix 
					stylix.homeModules.stylix
				];
			};	
		};
	};
}
