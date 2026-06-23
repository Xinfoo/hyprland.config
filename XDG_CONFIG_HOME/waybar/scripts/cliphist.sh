#!/usr/bin/env bash
set -euo pipefail

case "${1:-pick}" in
  clear)
    cliphist wipe
    notify-send "Clipboard" "History cleared"
    ;;
  pick)
    if command -v wofi >/dev/null 2>&1; then
      selection=$(cliphist list | wofi --dmenu --prompt "Clipboard")
      [ -n "$selection" ] || exit 0

      printf '%s\n' "$selection" | cliphist decode | wl-copy

      if command -v hyprctl >/dev/null 2>&1; then
        sleep 0.15
        hyprctl -q dispatch sendshortcut CTRL,V,activewindow >/dev/null 2>&1 || true
      fi
    else
      notify-send "Clipboard" "Install wofi to browse cliphist"
    fi
    ;;
esac
