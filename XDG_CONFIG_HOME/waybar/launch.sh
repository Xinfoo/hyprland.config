#!/usr/bin/env bash
set -euo pipefail

config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
waybar_dir="$config_home/waybar"
runtime_dir="${XDG_RUNTIME_DIR:-/tmp}"
lock_file="$runtime_dir/waybar-launch.lock"

exec 200>"$lock_file"
flock -n 200 || exit 0

pkill -x waybar 2>/dev/null || true
sleep 0.2

exec waybar -c "$waybar_dir/config" -s "$waybar_dir/style.css"
