{ config, pkgs, ... }:

{
	programs.niri.enable = true;

	services.getty.autologinUser = "oso";

	security.polkit.enable = true;
}
