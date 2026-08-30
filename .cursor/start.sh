#!/usr/bin/env bash
# Per-boot startup for the punk & rally (Glance) dev environment.
# Ensures the Docker daemon is running, then (re)creates the Glance container
# serving the repo's config + assets on http://localhost:7580.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

# 1. Start dockerd if it is not already up (no systemd on this image).
if ! sudo docker info >/dev/null 2>&1; then
  sudo rm -f /var/run/docker.pid 2>/dev/null || true
  sudo setsid dockerd >/tmp/dockerd.log 2>&1 < /dev/null &
  for _ in $(seq 1 30); do
    if sudo docker info >/dev/null 2>&1; then break; fi
    sleep 1
  done
fi

if ! sudo docker info >/dev/null 2>&1; then
  echo "ERROR: docker daemon did not come up; see /tmp/dockerd.log" >&2
  exit 1
fi

# 2. Ensure secrets file exists (blank values are fine for local preview).
[ -f .env ] || cp .env.example .env

# 3. (Re)create the Glance container. Config + assets are bind-mounted so edits
#    are picked up on the next Glance config reload / container restart.
sudo docker rm -f glance-dev >/dev/null 2>&1 || true
sudo docker run -d --name glance-dev --restart unless-stopped \
  -p 7580:8080 \
  --env-file .env \
  -e "SEERR_URL=${SEERR_URL:-http://192.168.1.2:5055}" \
  -e "SEERR_HREF=${SEERR_HREF:-https://seerr.example.invalid}" \
  -v "$REPO_ROOT/config:/app/config:ro" \
  -v "$REPO_ROOT/assets:/app/assets:ro" \
  glanceapp/glance:latest

echo "Glance is starting on http://localhost:7580"
