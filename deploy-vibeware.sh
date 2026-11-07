#!/usr/bin/env bash
# Deploy the game to https://standardvibeware.click/rub/
# Static copy served by the standardvibeware nginx:alpine container on 42.80.0.19
# (web root bind: /home/default/projects/standartvibeware/html, read-only mount).
set -euo pipefail
cd "$(dirname "$0")"

HOST=default@42.80.0.19
REMOTE_DIR=/home/default/projects/standartvibeware/html/rub

scp index.html "$HOST:$REMOTE_DIR/index.html"
echo "deployed, verifying..."
sleep 1
tmp=$(mktemp)
if curl -sf -m 15 -o "$tmp" https://standardvibeware.click/rub/ && grep -q "RUB-A-MONSTER MAKER" "$tmp"; then
  echo "OK: https://standardvibeware.click/rub/ is live"
else
  echo "WARN: verification failed — check https://standardvibeware.click/rub/ manually" >&2
  rm -f "$tmp"
  exit 1
fi
rm -f "$tmp"
