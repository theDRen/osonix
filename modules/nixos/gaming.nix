{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.heroic ];

	programs.gamemode.enable = true;
	programs.gamescope.enable = true;
	programs.steam.enable = true;
	programs.steam.extraCompatPackages = [ pkgs.proton-ge-bin ];
	programs.steam.gamescopeSession.enable = true;
}
