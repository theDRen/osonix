{ config, pkgs, ... }:

{
	programs.ghostty = {
		enable = true;
		installVimSyntax = true;
		settings = {
			font-family = "VictorMono Nerd Font";
			font-size = 11;
			theme = "catppuccin-mocha";
		};
	};
}
