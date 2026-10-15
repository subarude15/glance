# FrameXTV integration: verified baseline and next steps

Date: 2026-10-15

## Scope of this branch

The Watch page has a new FrameXTV bookmark group linking to the official site in a normal browser context. Existing Emby data, existing Stream bookmarks, and Docker settings are unchanged. It is a **launcher only**, not an embedded native player or Google Cast sender. No playback claims are made.

## External findings and limitations

- The submitted URL is https://framextv.xyz/api. Attempts to retrieve this page and the homepage from the available web browsing environment failed (tool blocked or inaccessible). Consequently no API contract, CORS, iframe policy, streaming URLs, or DRM status was verified.
- Public descriptions from the project's author claim search, catalogue, responsive PWA, history and an embeddable player, but these claims were **not independently functionally tested here**.
- There is no confirmed Google Cast receiver-compatible media URL. Sending a website URL to a Chromecast is not equivalent to casting the video.
- iOS Safari does not provide the Google Cast Web Sender SDK as a general-purpose browser sender. iPad casting needs a supported native app, a separately controlled TV receiver, or another tested architecture.
- Fullscreen is handled by the destination site's video player if it supports it. The Glance link itself cannot force fullscreen.

## Validation performed

- Repository structure checked: Glance YAML-configured Watch page with Emby custom API and existing bookmarks.
- Changed only `config/glance.yml` by inserting a `bookmarks` widget before the existing Stream group.
- Confirm the YAML parses and the link functions after deployment; tests requiring the live NAS container or physical iPad/Google TV **have not been run**.

## Proposed follow-up: only after endpoint verification

1. Open `https://framextv.xyz/api` in a local browser with developer tools. Capture the documented endpoints and supported embed parameters, without harvesting authentication tokens or protected stream URLs.
2. Check the site's published terms and permission for third-party embedding. Test frame headers (`Content-Security-Policy: frame-ancestors`, `X-Frame-Options`) and real playback in iPad Safari.
3. If embedding is supported, prototype a separately hosted, sandboxed mobile player page, with a graceful **Open on FrameXTV** fallback.
4. For Chromecast, establish whether a receiver-accessible and permitted HTTPS HLS/DASH/MP4 URL exists and test on a real Google TV. Do **not** proxy DRM or bypass authorization, CORS, restrictions or access controls.
5. Plan iPad-to-Google-TV casting separately: Safari browser-only casting cannot be assumed. Consider a native sender/receiver pairing only once the streams and rights are verified.
6. Progress syncing should be opt-in and stored by household profile with access control, not in a public Glance widget.

## Manual acceptance checklist

- [ ] `docker compose config` succeeds in deployment environment
- [ ] Glance starts and Watch page loads
- [ ] Existing Emby library and Now Playing widgets still work
- [ ] Existing stream bookmarks still appear
- [ ] FrameXTV launcher opens externally on desktop and iPad
- [ ] FrameXTV site playback can enter fullscreen (provider dependent)
- [ ] Google Cast feasibility validated on a compatible device (future)
