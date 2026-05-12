#!/usr/bin/env bash

# setup monitor
declare -A profiles

# Dual landscape setup (DP + HDMI)
profiles[dual]='nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_165 +5120+0 {viewportin=5120x2880,viewPortOut:2560x1440+0+0,panning=5120x2880}, HDMI-0: 2560x1440_144 +0+0 {viewportin=5120x2880,viewPortOut:2560x1440+0+0,panning=5120x2880}"'

# Single monitor setup (DP only)
profiles[single]='nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_165 +0+0 {viewportin=5120x2880,viewPortOut:2560x1440+0+0,panning=5120x2880}"'

# Vertical + landscape (HDMI rotated right, DP normal)
profiles[vertical]='nvidia-settings --assign CurrentMetaMode="HDMI-0: 2560x1440_144 +0+968 {rotation=left,viewportin=2304x4096,viewPortOut:2560x1440+0+0,panning=2304x4096}, DP-0: 2560x1440_165 +4096+0 {viewportin=4096x2160}"'

# ------------------------------------------------------------------------

list_profiles() {
	echo "Available monitor profiles:"
	for p in "${!profiles[@]}"; do
		echo "  - $p"
	done
}

list_profiles() {
	echo "Available monitor profiles:"
	for p in "${!profiles[@]}"; do
		echo "  - $p"
	done
}

apply_profile() {
	local p=$1
	if [[ -n "${profiles[$p]}" ]]; then
		echo "Applying monitor profile: $p"
		eval "${profiles[$p]}"
	else
		echo "Unknown profile: $p"
		list_profiles
		exit 1
	fi
}

# If no arg, auto-detect by monitor count
if [[ $# -eq 0 ]]; then
	monitors=$(xrandr --listmonitors | awk '/^Monitors:/ { print $2 }')
	if [[ "$monitors" -gt 1 ]]; then
		apply_profile dual
	else
		apply_profile single
	fi
else
	case $1 in
	list | -l | --list)
		list_profiles
		;;
	*)
		apply_profile "$1"
		;;
	esac
fi
