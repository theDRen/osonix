{ config, pkgs, ... }:

{
	# Bootloader - GRUB, UEFI, dual-boot aware
	boot.loader.grub = {
		enable = true;
		efiSupport = true;
		device = "nodev";
		useOSProber = true;
	};
	boot.loader.efi.canTouchEfiVariables = true;

	hardware.cpu.amd.updateMicrocode = true;
	hardware.enableRedistributableFirmware = true;

	# Networking
	networking.hostName = "osonix";
	networking.networkmanager.enable = true;

	# Time & Locale
	time.timeZone = "America/New_York";
	i18n.defaultLocale = "en_US.UTF-8";
}
