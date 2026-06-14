# ⚠️ PER-MACHINE PLACEHOLDER — REPLACE BEFORE SWITCHING ⚠️
#
# This file must contain the REAL hardware config of the machine you're
# switching onto: its fileSystems, UUIDs, kernel modules, etc. A fresh NixOS
# install generates exactly that at /etc/nixos/hardware-configuration.nix.
#
# On the freshly-installed machine, overwrite this file with that one:
#
#   git clone https://github.com/theDRen/osonix
#   cp /etc/nixos/hardware-configuration.nix \
#      osonix/modules/nixos/hardware-configuration.nix
#   sudo nixos-rebuild switch --flake ./osonix#osonix
#
# Until you do that, evaluation intentionally fails with
# "does not specify your root file system" — that's the safety net telling
# you this placeholder hasn't been replaced yet. Do NOT hardcode UUIDs here
# by hand; let nixos-generate-config (run during install) produce them.

{ ... }:

{
	# No fileSystems defined on purpose — see the note above.
}
