{config, pkgs, ...}:

{
	system.stateVersion = "25.05";

	users.users.oso = {
		isNormalUser = true;
		initialPassword = "test";
		extraGroups = [ "wheel" ];
	};
}
