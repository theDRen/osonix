{ config, pkgs, ... }:

{
	programs.niri.settings.layout.focus-ring.width = 2;
	programs.niri.settings.spawn-at-startup = [
		{ command = [ "discord" ]; }
		{ command = [ "vivaldi" ]; }
		{ command = [ "steam" ]; }
		{ command = [ "awww-daemon" ]; }
		{ command = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ]; }
		{ command = [ "sh" "-c" "awww img ~/Pictures/darkanimegirl.jpg" ]; }
	];
	programs.niri.settings.input = {
		keyboard.numlock = true;
		touchpad = {
			tap = true;
			natural-scroll = true;
		};
	};
	programs.niri.settings.prefer-no-csd = true;
	programs.niri.settings.animations.slowdown = 2.5;
	programs.niri.settings.hotkey-overlay.skip-at-startup = true;
	programs.niri.settings.window-rules = [
		{
			geometry-corner-radius = {
				top-left = 12.0;
				top-right = 12.0;
				bottom-left = 12.0;
				bottom-right = 12.0;
			};
			clip-to-geometry = true;
		}
		{
			matches = [ { app-id = "com.mitchellh.ghostty"; } ];
			opacity = 0.7;
		}
	];
	programs.niri.settings.binds = with config.lib.niri.actions; {
		"Mod+T".action = spawn "ghostty";
		"Mod+M".action = spawn "fuzzel";
		"Mod+G".action.screenshot-window = {};
		"Mod+O" = { action = toggle-overview; repeat = false; };
		"Mod+Q" = { action = close-window; repeat = false; };

		"Mod+H".action = focus-column-left;
		"Mod+WheelScrollUp".action = focus-column-left;
		"Mod+L".action = focus-column-right;
		"Mod+WheelScrollDown".action = focus-column-right;
		"Mod+J".action = focus-window-or-workspace-down;
		"Mod+Shift+WheelScrollDown" = { action = focus-workspace-down; cooldown-ms = 150; };
		"Mod+K".action = focus-window-or-workspace-up;
		"Mod+Shift+WheelScrollUp" = { action = focus-workspace-up; cooldown-ms = 150; };

		"Mod+Shift+H".action = move-column-left;
		"Mod+Shift+L".action = move-column-right;
		"Mod+Shift+J".action = move-window-down;
		"Mod+Shift+K".action = move-window-up;

		"Mod+Ctrl+J".action = move-column-to-workspace-down;
		"Mod+Ctrl+WheelScrollDown" = { action = move-column-to-workspace-down; cooldown-ms = 150; };
		"Mod+Ctrl+K".action = move-column-to-workspace-up;
		"Mod+Ctrl+WheelScrollUp" = { action = move-column-to-workspace-up; cooldown-ms = 150; };

		"Mod+Ctrl+Shift+H".action = move-column-left;
		"Mod+Ctrl+Shift+L".action = move-column-right;

		"Mod+F".action = maximize-column;
		"Mod+Shift+F".action = fullscreen-window;


		"Mod+Shift+Q".action = quit;
	};
}
