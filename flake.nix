{
	description = "The OS of Nix";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... }: {

		nixosConfigurations.osonix = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
			];
		};

		nixosConfigurations.iso = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				"${nixpkgs}/nixos/modules/installer/cd-dvd/installations-cd-minimal.nix"
				./configuration.nix
			];
		};

	};
}
