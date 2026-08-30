---
version: alpha
name: punk & rally
description: Clean studio-style Glance dashboard — DM Sans neo-grotesk type, orange accent, soft surfaces, dual light/dark via prefers-color-scheme. Mobile-first widget grid.
colors:
  background: "#121212"
  background-light: "#F7F6F3"
  surface: "#1A1A1A"
  surface-light: "#FFFFFF"
  surface-elevated: "rgba(26, 26, 26, 0.88)"
  border: "rgba(255, 255, 255, 0.08)"
  border-light: "rgba(0, 0, 0, 0.08)"
  primary: "#FB4617"
  primary-light: "#E03D12"
  secondary: "#3BA89C"
  tertiary: "#FB4617"
  neutral: "#121212"
  on-primary: "#FFFFFF"
  on-surface: "#F5F5F5"
  on-surface-light: "#111111"
  muted: "#8C8C8C"
  positive: "#3BA89C"
  negative: "#E03A3A"
  shadow: "transparent"
typography:
  brand:
    fontFamily: DM Sans
    fontSize: 1.25rem
    fontWeight: "700"
    letterSpacing: -0.03em
  widget-title:
    fontFamily: DM Sans
    fontSize: 1.05rem
    fontWeight: "600"
    letterSpacing: -0.03em
  stat-num:
    fontFamily: DM Sans
    fontSize: 1.75rem
    fontWeight: "700"
    letterSpacing: -0.04em
  stat-label:
    fontFamily: DM Sans
    fontSize: 0.65rem
    fontWeight: "600"
    letterSpacing: 0.08em
  body:
    fontFamily: DM Sans
    fontSize: 0.9rem
    fontWeight: "500"
    letterSpacing: -0.01em
  nav:
    fontFamily: DM Sans
    fontSize: 0.875rem
    fontWeight: "600"
    letterSpacing: -0.02em
rounded:
  none: 0px
  sm: 6px
  md: 10px
  lg: 12px
  pill: 999px
spacing:
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  2xl: 32px
components:
  widget-card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.md}"
    padding: 20px
  page-canvas:
    backgroundColor: "{colors.background}"
    textColor: "{colors.on-surface}"
  bookmark-pill:
    backgroundColor: "transparent"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.pill}"
    padding: 8px
  bookmark-pill-hover:
    backgroundColor: "rgba(251, 70, 23, 0.08)"
    textColor: "{colors.primary}"
  stat-number:
    backgroundColor: "transparent"
    textColor: "{colors.primary}"
    typography: "{typography.stat-num}"
  stat-label:
    backgroundColor: "transparent"
    textColor: "{colors.muted}"
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
    rounded: "{rounded.sm}"
  widget-border:
    backgroundColor: "{colors.border}"
    textColor: "{colors.border}"
---

## Overview

**punk & rally** is a homelab media dashboard (Glance) with a clean studio aesthetic inspired by contemporary product-design portfolios: neo-grotesk type, near-black / warm-off-white canvases, a single orange accent, soft card radii, and no comic-book chrome.

Brand name stays **punk & rally** — set in DM Sans, not marker fonts. The UI should feel calm and inevitable, not busy.

Pages: **Home** (ops: clock, weather, speed, NAS, search, trending media), **Watch** (Emby library + now playing + stream bookmarks), **Request** (Seerr iframe). Desktop uses multi-column layout; mobile stacks columns and uses a bottom page-link bar.

Theme follows the OS: `prefers-color-scheme` drives light/dark. No in-app theme picker.

## Colors

One accent; surfaces stay quiet.

- **Dark background (#121212):** Near-black with a soft orange radial wash + light grain — never a concrete wall texture.
- **Light background (#F7F6F3):** Warm off-white with the same subtle washes.
- **Surface:** Slightly lifted cards (`#1A1A1A` dark / white light) with 1px hairline borders.
- **Primary / orange (#FB4617):** Links, stats, active nav, now-playing accents. Slightly darker on light backgrounds.
- **Positive / teal (#3BA89C):** Healthy/meta only — quieter than the orange.
- **Negative:** Failures only.
- **Muted:** Secondary labels and empty states.

Do not use purple-indigo SaaS gradients, glow stacks, hard offset shadows, or street-art textures.

## Typography

Single family — **DM Sans** (500/600/700). Avoid Inter, Roboto, Arial, and system UI defaults as the primary face.

- Titles: weight 600, tight tracking (~-0.03em), sentence case (no forced lowercase Marker look).
- Stats: weight 700, orange, tighter tracking.
- Labels: tiny uppercase, muted, modest tracking.

## Layout

- **Desktop Home:** 3 columns — small | full | small.
- **Watch:** 2 columns (small | full) on desktop/laptop/tablet (Play bookmarks & status on left, Library stats, Now Playing, and Stream bookmarks on right); stacks neatly on mobile phones.
- **Widgets:** 1px hairline border, 10–12px radius, no hard shadows, no top dashed stripe.
- **Breakpoints:** Below ~1190px, columns stack; docker alerts hide; floating liquid-glass pill nav shows page links at the bottom.

## Elevation & Depth

- Prefer flat cards with hairline borders over shadows.
- Atmosphere comes from soft radial washes + subtle SVG grain, not photos of walls.
- Bookmark chips are ghost outlines that tint orange on hover — no sticker lift.

## Shapes

- Card radius ~10px; posters ~6px; bookmark chips fully pill; mobile floating navigation pill.
- No Permanent Marker titles, no 2px comic borders, no `4px 4px 0` shadows.

## Components

- **Widget card:** Quiet surface, DM Sans title, hairline border.
- **Stat block:** Large orange number + muted uppercase label.
- **Bookmark chip:** Pill outline; orange border/tint on hover.
- **Now playing row:** 2px orange left rule; user in accent; meta muted.
- **Poster row:** Soft-radius thumb with hairline border.
- **Docker alerts:** Hide healthy rows; empty → “all clear.” in positive teal.
- **Mobile/Floating nav:** Apple-style liquid glass floating pill at bottom, frosted blur with saturation boost, specular inner highlights, active orange pill indicator.

## Do's and Don'ts

**Do**

- Keep orange as the only loud accent; teal for healthy/meta.
- Support light and dark equally via `prefers-color-scheme`.
- Design mobile-first (stacked columns + bottom page links).
- Preserve the **punk & rally** name in the nav/brand mark.

**Don't**

- Don’t bring back wall textures, Permanent Marker, IBM Plex Mono sticker chrome, or hard offset shadows.
- Don’t add Inter/Roboto/system fonts, purple glows, or dense card clutter.
- Don’t put private IPs, API keys, or live credentials in Stitch mockups — sample data only.
- Don’t overpower the brand name with a larger generic headline.
