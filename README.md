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

## Google Stitch design export

To redesign the UI in [Google Stitch](https://stitch.withgoogle.com/) without logging into the live dashboard:

| Path | Use |
|------|-----|
| [`DESIGN.md`](DESIGN.md) | Import into Stitch as the design system |
| [`stitch/`](stitch/) | Static mockups + prompts (sample data only) |

See [`stitch/README.md`](stitch/README.md) for the full workflow (DESIGN.md import, screenshots, or public URL extraction).
