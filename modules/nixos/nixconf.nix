{ config, pkgs, ... }:

{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nix.settings.extra-substituters = [ "https://niri.cachix.org" ];
	nix.settings.extra-trusted-public-keys = [
		"niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
	];

	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};
}
