#!/usr/bin/env bash
set -euo pipefail

if ! command -v playerctl >/dev/null 2>&1; then
  printf '{"text":""}\n'
  exit 0
fi

status=$(playerctl status 2>/dev/null || true)
if [ -z "$status" ]; then
  printf '{"text":""}\n'
  exit 0
fi

artist=$(playerctl metadata artist 2>/dev/null || true)
title=$(playerctl metadata title 2>/dev/null || true)
text="${artist:+$artist - }$title"
escaped_text=$(printf '%s' "$text" | sed 's/\\/\\\\/g; s/"/\\"/g')

if [ -z "$text" ]; then
  printf '{"text":""}\n'
elif [ "$status" = "Playing" ]; then
  printf '{"text":" %s","class":"playing"}\n' "$escaped_text"
else
  printf '{"text":" %s","class":"paused"}\n' "$escaped_text"
fi
