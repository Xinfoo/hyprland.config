#!/usr/bin/env bash
set -euo pipefail

count=0

if command -v checkupdates >/dev/null 2>&1; then
  updates=$(checkupdates 2>/dev/null || true)
  count=$(printf '%s\n' "$updates" | sed '/^$/d' | wc -l)
elif command -v pacman >/dev/null 2>&1; then
  updates=$(pacman -Qu 2>/dev/null || true)
  count=$(printf '%s\n' "$updates" | sed '/^$/d' | wc -l)
fi

if [ "$count" -gt 0 ]; then
  printf '{"text":"󰏖 %s","class":"available","tooltip":"%s package updates available"}\n' "$count" "$count"
else
  printf '{"text":""}\n'
fi
