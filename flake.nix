{

	description = "System config flake";


	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		home-manager.url = "github:nix-community/home-manager/release-25.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};


	outputs = { self, nixpkgs, home-manager, ... }: 
		let
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legayPackages.${system};

		in
		{
		nixosConfigurations = {
			typhlosion = lib.nixosSystem {
				inherit system;
				modules = [ ./configuration.nix ];
			};
		};

		homeConfigurations = {
			ethanj203 = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home.nix ];
			};
		};
			
	};
}
