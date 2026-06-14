{ config, lib, pkgs, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	# Kernel modules needed early in boot for NVMe + USB input/storage.
	boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-amd" ];
	boot.extraModulePackages = [ ];

	# Filesystems on /dev/nvme0n1 (referenced by UUID so device order can't break boot).
	fileSystems."/" = {
		device = "/dev/disk/by-uuid/71a72ee7-8b56-4d81-8f3c-255c45451172";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/9775-970A";
		fsType = "vfat";
		options = [ "fmask=0077" "dmask=0077" ];
	};

	fileSystems."/home" = {
		device = "/dev/disk/by-uuid/019e7a19-8fc5-4d4e-9172-539d1b6400c9";
		fsType = "ext4";
	};

	# No on-disk swap partition; using zram (configured below).
	swapDevices = [ ];
	zramSwap.enable = true;

	networking.useDHCP = lib.mkDefault true;

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
