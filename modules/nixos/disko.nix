{ ... }:

{
	disko.devices.disk.main = {
		type = "disk";
		device = "/dev/nvme0n1";
		content = {
			type = "gpt";
			partitions = {
				ESP = {
					priority = 1;
					size = "1G";
					type = "EF00";
					content = {
						type = "filesystem";
						format = "vfat";
						mountpoint = "/boot";
						mountOptions = [ "umask=0077" ];
					};
				};
				swap = {
					priority = 2;
					size = "16G";
					content = {
						type = "swap";
						resumeDevice = true;
					};
				};
				root = {
					priority = 3;
					size = "100%";
					content = {
						type = "filesystem";
						format = "ext4";
						mountpoint = "/";
					};
				};
			};
		};
	};
}
