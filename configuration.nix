{config, pkgs, inputs, ... }:

{
	imports = [
		./modules/nixos/hardware-configuration.nix
		./modules/nixos/system.nix
		./modules/nixos/desktop.nix
		./modules/nixos/audio.nix
		./modules/nixos/fonts.nix
		./modules/nixos/gaming.nix
		./modules/nixos/vm.nix
		./modules/nixos/nixconf.nix
		./modules/nixos/fcitx.nix
	];

	system.stateVersion = "25.05";

	users.users.oso = {
		isNormalUser = true;
		initialPassword = "test";
		extraGroups = [ "wheel" ];
		shell = pkgs.zsh;
	};

	nixpkgs.config.allowUnfree = true;

	programs.zsh.enable = true;

	home-manager.extraSpecialArgs = { inherit inputs; };
	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;
	home-manager.users.oso = import ./home.nix;
}
