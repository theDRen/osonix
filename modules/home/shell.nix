{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		autocd = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		defaultKeymap = "viins";

		history = {
			size = 100000;
			save = 100000;
			ignoreDups = true;
			share = true;
			expireDuplicatesFirst = true;
		};

		loginExtra = ''
			if [ "$(tty)" = "/dev/tty1" ]; then
				exec niri --session
			fi
		'';

		shellAliases = {
			".." = "cd ..";
			"..." = "cd ~";
			switch = "sudo nixos-rebuild switch --flake ~/.config/nixos#osonix";
			update = "nix flake update --flake ~/.config/nixos";
			search = "nix search nixpkgs";
			nixconf = "nvim ~/.config/nixos";

			ls = "eza -a --icons";	lsl = "eza -la --icons";
			lst = "eza --tree";		lsa = "eza -a1 --icons";

			reboot = "sudo systemctl reboot";	sleep = "sudo systemctl suspend";
			off = "poweroff";	vm = "virt-manager";	logitech = "solaar";

			sb = "brightnessctl set";
			sv = "pactl set-sink-volume @DEFAULT_SINK@";
			svmid = "pactl set-sink-volume @DEFAULT_SINK@ 44%";
			svmidhi = "pactl set-sink-volume @DEFAULT_SINK@ 64%";
			svmax = "pactl set-sink-volume @DEFAULT_SINK@ 120%";

			dlmp3 = "yt-dlp -x --audio-format mp3 --no-playlist";
			dlvid = "yt-dlp --no-playlist";
			record = "wf-recorder --audio -f";

			dots = "cd ~/sync/Lua_Projects/dots/";
			weather = "curl wttr.in?&u";
		};

		initContent = ''
			setopt prompt_subst
			PROMPT=$'\n%F{69}%~ %F{129}%B≫ %b%f '
		'';
	};

	home.sessionPath = [ "${config.home.homeDirectory}/go/bin" ];
}
