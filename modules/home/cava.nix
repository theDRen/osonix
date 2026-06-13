{ config, pkgs, ... }:

{
	programs.cava = {
		enable = true;
		settings = {
			general = {
				mode = "normal";
				framerate = 60;
				sensitivity = 44;
				bars = 0;
				bar_width = 1;
				bar_spacing = 1;
				bar_height = 28;
				orientation = "bottom";
				channels = "stereo";
				mono_option = "average";
				reverse = 1;
				waveform = 1;
			};
			color = {
				gradient = 1;
				gradient_color_1 = "'#0000FF'";
				gradient_color_2 = "'#1E90FF'";
				gradient_color_3 = "'#4B0082'";
				gradient_color_4 = "'#9400D3'";
				gradient_color_5 = "'#8A2BE2'";
				gradient_color_6 = "'#C71585'";
				gradient_color_7 = "'#FF1493'";
				gradient_color_8 = "'#FF00FF'";
			};
			smoothing = {
				monstercat = 1;
				waves = 1;
			};
			eq = { "1" = 1; "2" = 1; "3" = 1; "4" = 1; "5" = 1; };
		};
	};
}
