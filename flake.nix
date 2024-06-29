{
	description = "My system configuration";

	inputs = { 
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = { nixpkgs, home-manager, stylix, ...}: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ 
        ./configuration.nix 
        stylix.nixosModules.stylix
      ];
		};

		homeConfigurations.relow = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages."x86_64-linux";
			modules = [ 
        ./home.nix 
      ];
		};

	};
}
