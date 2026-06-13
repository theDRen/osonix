{ config, pkgs, inputs, ... }:

{
	imports = [
		inputs.nixvim.homeModules.nixvim
		./modules/home/niri.nix
		./modules/home/shell.nix
		./modules/home/terminal.nix
		./modules/home/packages.nix
		./modules/home/cava.nix
		./modules/home/nvim.nix
	];

	home.username = "oso";
	home.homeDirectory = "/home/oso";
	home.stateVersion = "25.05";
	home.file."Pictures/darkanimegirl.jpg".source = ./wallpapers/darkanimegirl.jpg;
}
