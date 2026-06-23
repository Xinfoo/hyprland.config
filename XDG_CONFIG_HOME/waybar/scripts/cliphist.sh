#!/usr/bin/env bash
set -euo pipefail

case "${1:-pick}" in
  clear)
    cliphist wipe
    notify-send "Clipboard" "History cleared"
    ;;
  pick)
    if command -v wofi >/dev/null 2>&1; then
      cliphist list | wofi --dmenu --prompt "Clipboard" | cliphist decode | wl-copy
    else
      notify-send "Clipboard" "Install wofi to browse cliphist"
    fi
    ;;
esac
