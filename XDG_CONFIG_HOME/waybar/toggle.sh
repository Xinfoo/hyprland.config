#!/usr/bin/env bash
set -euo pipefail

if pgrep -x waybar >/dev/null; then
  pkill -x waybar
else
  exec uwsm app -- "${XDG_CONFIG_HOME:-$HOME/.config}/waybar/launch.sh"
fi
