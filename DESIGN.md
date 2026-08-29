---
version: alpha
name: punk & rally
description: Distressed street-art homelab dashboard theme for Glance — dark wall texture, Permanent Marker titles, IBM Plex Mono stats, orange/teal accents, hard offset shadows.
colors:
  background: "#0A0A0A"
  surface: "#1A1A1A"
  surface-elevated: "rgba(26, 26, 26, 0.92)"
  border: "#2E2E2E"
  border-strong: "#383838"
  primary: "#FF6600"
  secondary: "#10C6B7"
  tertiary: "#FF6600"
  neutral: "#0A0A0A"
  on-primary: "#0A0A0A"
  on-surface: "#F2F2F2"
  muted: "#8A8A8A"
  positive: "#10C6B7"
  negative: "#E83030"
  shadow: "rgba(0, 0, 0, 0.55)"
typography:
  brand:
    fontFamily: Permanent Marker
    fontSize: 1.25rem
    fontWeight: "400"
    letterSpacing: 0.04em
  widget-title:
    fontFamily: Permanent Marker
    fontSize: 1.1rem
    fontWeight: "400"
    letterSpacing: 0.04em
  stat-num:
    fontFamily: IBM Plex Mono
    fontSize: 1.75rem
    fontWeight: "700"
  stat-label:
    fontFamily: IBM Plex Mono
    fontSize: 0.65rem
    fontWeight: "500"
    letterSpacing: 0.12em
  body:
    fontFamily: IBM Plex Mono
    fontSize: 0.9rem
    fontWeight: "500"
  nav:
    fontFamily: Permanent Marker
    fontSize: 0.875rem
    fontWeight: "400"
rounded:
  none: 0px
  sm: 2px
  md: 5px
spacing:
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  2xl: 32px
components:
  widget-card:
    backgroundColor: "{colors.surface-elevated}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.none}"
    padding: 20px
  page-canvas:
    backgroundColor: "{colors.background}"
    textColor: "{colors.on-surface}"
  bookmark-pill:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.none}"
    padding: 8px
  bookmark-pill-hover:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.on-surface}"
  stat-number:
    backgroundColor: "transparent"
    textColor: "{colors.primary}"
    typography: "{typography.stat-num}"
  stat-label:
    backgroundColor: "transparent"
    textColor: "{colors.positive}"
    typography: "{typography.stat-label}"
  muted-copy:
    backgroundColor: "transparent"
    textColor: "{colors.muted}"
    typography: "{typography.body}"
  nav-active:
    backgroundColor: "transparent"
    textColor: "{colors.primary}"
  status-ok:
    backgroundColor: "transparent"
    textColor: "{colors.positive}"
  status-bad:
    backgroundColor: "transparent"
    textColor: "{colors.negative}"
  poster-thumb:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.md}"
  widget-border:
    backgroundColor: "{colors.border}"
    textColor: "{colors.border-strong}"
---

## Overview

**punk & rally** is a homelab media dashboard (Glance) with a distressed street-art vibe: spray-paint titles, sticker-style link chips, hard comic-book shadows, and a dark concrete wall texture behind everything.

Brand name must read as a hero signal — Permanent Marker, lowercase where titles appear. The product is not a soft SaaS dashboard; it should feel like a garage wall plastered with stickers and stats.

Pages: **Home** (ops: clock, weather, speed, NAS, search, trending media), **Watch** (Emby library + now playing + stream bookmarks), **Request** (Seerr iframe). Desktop uses multi-column layout; mobile stacks columns and uses a bottom page-link bar.

## Colors

Dark-first palette with two loud accents only.

- **Background (#0A0A0A):** Near-black base; always layered with wall texture + noise, never flat.
- **Surface (#1A1A1A / 92% alpha):** Widget cards — slightly lifted over the wall.
- **Primary / orange (#FF6600):** Stats, active nav, bookmark borders, now-playing accents, logo drop-shadow energy.
- **Secondary / teal (#10C6B7):** Labels, healthy/positive states, “all clear” messaging.
- **Negative (#E83030):** Failures and unhealthy container states only.
- **Muted (#8A8A8A):** Secondary copy, empty states (“nothing on rn.”).

Do not introduce purple, glow blurs, or soft pastel fills. Keep contrast harsh.

## Typography

Two expressive faces — never Inter/Roboto/system UI defaults.

- **Permanent Marker:** Brand, widget titles, mobile nav, celebratory status (“all clear.”). Prefer lowercase titles with slight letter-spacing.
- **IBM Plex Mono (500/700):** Body, stats, labels. Stat numbers are bold orange; labels are tiny teal uppercase with wide tracking.

## Layout

- **Desktop Home:** 3 columns — small | full | small. Left: clock, weather, internet, server, devices, search, bookmarks, app monitor. Center: trending + new movies/TV. Right: docker alerts + restart/files shortcuts.
- **Watch:** Single full-width column of stacked widgets (play bookmarks → library stats → now playing → Emby status → stream bookmarks).
- **Widgets:** Hard 2px border (`#2E2E2E`), `4px 4px 0` black offset shadow, orange dashed stripe along the top edge of each card.
- **Breakpoints:** Below ~1190px, columns stack; docker alerts hide; bottom nav shows page links only.

## Elevation & Depth

- Cards use hard offset shadows (`4px 4px 0 rgba(0,0,0,0.55)`), not soft multi-layer blurs.
- Logo uses a hard drop-shadow (`2px 2px 0`).
- Bookmark pills lift 1px on hover (`translate(-1px,-1px)` + stronger shadow).
- Wall texture (`soft-light`) + SVG noise (`overlay`) sit behind all content; `background-attachment: fixed`.

## Shapes

- Default radius is effectively square (`0–2px`). Poster thumbnails may use `5px`.
- No pill clusters, no floating badges over hero media, no rounded-full chrome.
- Bookmark links are rectangular “sticker” chips with 2px orange borders.

## Components

- **Widget card:** Dark translucent panel, orange top stripe, Permanent Marker title.
- **Stat block:** Centered number (orange mono) + tiny teal label underneath.
- **Bookmark sticker:** Inline chip, orange border, hard shadow, hover nudge.
- **Now playing row:** Left orange border, user/title in orange, device meta in teal.
- **Poster row:** 5rem thumb with 2px border + hard shadow beside title/overview.
- **Docker alerts:** Hide healthy rows; if none left, show “all clear.” in Marker teal.
- **Nav logo:** Compact brand mark (~2.25rem tall) with hard drop-shadow.

## Do's and Don'ts

**Do**

- Keep the wall texture + noise atmosphere on every screen.
- Use orange for energy/interaction and teal for healthy/meta labels.
- Preserve Permanent Marker + IBM Plex Mono pairing.
- Prefer hard offset shadows and sticker borders over soft UI chrome.
- Design for Glance’s widget grid (cards in columns), not a marketing landing page.

**Don't**

- Don’t flatten to a single solid background.
- Don’t swap in Inter/Roboto/system fonts or purple-indigo SaaS gradients.
- Don’t add floating promo chips, glow effects, or soft card blur stacks.
- Don’t put private IPs, API keys, or live credentials in Stitch mockups — use sample data only.
- Don’t overpower the **punk & rally** brand with a larger generic headline.
