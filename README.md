# punk & rally — Glance

Homelab dashboard for [Glance](https://github.com/glanceapp/glance): street-art theme, Emby library + now playing, and Docker container alerts.

## Setup

1. Copy secrets:
   ```bash
   cp .env.example .env
   # fill SEERR_API_KEY, SPEEDTEST_API_TOKEN, EMBY_API_KEY
   ```
2. Start:
   ```bash
   docker compose up -d
   ```
3. Open `http://<host>:7580`

## Layout

| Path | Notes |
|------|--------|
| `config/glance.yml` | Pages, widgets, theme |
| `assets/` | CSS, logo, wall texture |
| `compose.yaml` | Glance + Docker socket + assets mount |

`.env` is gitignored — never commit API keys.
