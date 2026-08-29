# Google Stitch export

Static design pack for feeding **punk & rally** into [Google Stitch](https://stitch.withgoogle.com/) without logging into the live Glance instance.

## What’s here

| Path | Purpose |
|------|---------|
| [`../DESIGN.md`](../DESIGN.md) | Stitch-native design system (import into a Stitch project) |
| [`index.html`](index.html) | Hub linking mockups |
| [`mockups/`](mockups/) | Sanitized UI references (sample data only) |
| [`PROMPTS.md`](PROMPTS.md) | Ready-to-paste Stitch prompts |
| [`assets/`](assets/) | Logo + wall texture |

## Feed Stitch (recommended)

1. Open Stitch → new **Web** project.
2. Import **`DESIGN.md`** from the repo root (Stitch design rules / DESIGN.md import).
3. Open a mockup in the browser (`mockups/home.html`, `watch.html`, or `mobile-home.html`).
4. Screenshot → upload as a **reference image** (Experimental / Pro mode).
5. Paste a prompt from `PROMPTS.md` and generate.

## GitHub / public URL path

Stitch can also **extract a design system from a public URL**. This repo is private by default, so Stitch cannot see live Glance or private GitHub files.

Options:

1. **GitHub Pages on this `stitch/` folder** (requires the site to be publicly reachable — private-repo Pages needs a paid plan, or publish a public fork/mirror of only `stitch/` + `DESIGN.md`).
2. **Public gist / public repo** containing just `DESIGN.md` + `stitch/` — then paste that Pages or raw URL into Stitch.
3. **Local screenshots** (always works; no public hosting).

Local preview:

```bash
cd stitch && python3 -m http.server 8765
# open http://127.0.0.1:8765/
```

## Privacy

Mockups use fake stats and redacted IPs. Do not paste `.env`, API keys, or real session data into Stitch.
