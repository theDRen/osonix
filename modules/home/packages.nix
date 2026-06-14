{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		awww
		blender
		brightnessctl
		btop
		curl
		discord
		eza
		fastfetch
		fuzzel
		gh
		git
		godot_4
		grim
		jq
		kdePackages.kate
		libresprite
		mpv
		nemo
		obs-studio
		pavucontrol
		retroarch-full
		slurp
		solaar
		teams-for-linux
		tiled
		tldr
		vivaldi
		wf-recorder
		wget
		xdg-utils
		xwayland-satellite
		yt-dlp
	];
}
