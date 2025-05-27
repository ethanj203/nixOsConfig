{

	description = "System config flake";


	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
	};


	outputs = { self, nixpkgs, ... }: 
		let
			lib = nixpkgs.lib;
		in
		{
		nixosConfigurations = {
			typhlosion = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./configuration.nix ];
			};
		};
	};
}
