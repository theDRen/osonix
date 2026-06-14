{
	description = "The OS of Nix";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		nixvim.url = "github:nix-community/nixvim";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		niri.url = "github:sodiboo/niri-flake";

		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs@{ self, nixpkgs, ... }: {

		nixosConfigurations.osonix = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				inputs.niri.nixosModules.niri
				inputs.home-manager.nixosModules.home-manager
				inputs.disko.nixosModules.disko
				./configuration.nix
			];
		};

		nixosConfigurations.iso = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				"${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
				({ pkgs, ... }: {
					nix.settings.experimental-features = [ "nix-command" "flakes" ];
					environment.systemPackages = [ pkgs.git ];

					boot.postBootCommands = "mount -o remount,size=32G /nix/.rw-store";
					zramSwap.enable = true;
				})
			];
		};


	};
}
