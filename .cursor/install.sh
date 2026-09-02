#!/usr/bin/env bash
# Idempotent setup for the punk & rally (Glance) dev environment.
# Installs Docker, configures a nested-friendly storage driver, prepares the
# local .env, and pre-pulls the Glance image so `start` can boot quickly.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

# 1. Docker engine (this repo deploys Glance via Docker).
if ! command -v docker >/dev/null 2>&1; then
  sudo apt-get update -y
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y docker.io
fi

# 2. This VM runs nested, where overlayfs snapshot mounts fail. The vfs
#    storage driver works reliably in that setting.
sudo mkdir -p /etc/docker
echo '{ "features": { "containerd-snapshotter": false }, "storage-driver": "vfs" }' \
  | sudo tee /etc/docker/daemon.json >/dev/null

# 3. Local secrets file. Values are blank by default; widgets that reach
#    external services simply render their empty/error states in the sandbox.
if [ ! -f .env ]; then
  cp .env.example .env
fi

# 4. Pre-pull the Glance image (best effort; `start` will pull if this is skipped).
if sudo docker info >/dev/null 2>&1; then
  sudo docker pull glanceapp/glance:latest || true
fi

echo "install.sh complete"
