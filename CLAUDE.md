# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal portfolio site for James Maggs. Vanilla HTML/CSS/JS — no framework, no build step. The source code is itself part of the product: markup should be clean, readable, and valid.

## Serving locally

```bash
python3 -m http.server -d public 8000
```

Visit `http://localhost:8000`. No build step required.

## Deploying

The CI workflow only triggers when `public/`, `Dockerfile`, `Caddyfile`, or `fly.toml` change — pushes that only touch `docs/` or other files do not deploy. `workflow_dispatch` always runs regardless.

Every qualifying push to `main` triggers `.github/workflows/deploy.yml`, which runs `flyctl deploy --remote-only` using the `FLY_API_TOKEN` GitHub secret. Deploys take ~45 seconds.

To deploy manually from the CLI:
```bash
flyctl deploy --remote-only
```

## Architecture

```
public/          # Site content — everything served to browsers
docs/            # Design references and assets (not deployed)
Dockerfile       # caddy:2-alpine; copies Caddyfile + public/ into image
Caddyfile        # Caddy config: serves public/ on :8080, apex redirect,
                 # gzip/zstd, 404 handler, security headers
fly.toml         # Fly.io app config (app: jamesmaggs-com, region: lhr)
```

Fly.io handles TLS termination and forwards plain HTTP to Caddy on port 8080. The `Host` header is preserved, which is how the apex→www redirect in the Caddyfile works.

The apex domain `jamesmaggs.com` issues a 301 redirect to `https://www.jamesmaggs.com`. All canonical content lives at `www`.

## Design system

`docs/design-system.html` is the canonical design reference — a self-contained HTML page showing all colour tokens, typography, spacing, motion, and components. It is the source of truth for tokens before they are applied to `public/`. Open it in a browser with the local server (serve from the repo root, not `public/`):

```bash
python3 -m http.server 8000
```

Then visit `http://localhost:8000/docs/design-system.html`.

### Token architecture

CSS custom properties are split into three blocks in the `<style>` tag:

1. **Invariant** (`:root`) — type scale, spacing scale, radii, motion. Never theme-specific. Tokens that resolve via `var()` references to theme tokens (e.g. `--tag-color: var(--text-secondary)`) also live here — they resolve at use-time so the correct theme value is picked up automatically.
2. **Dark theme** (`:root, [data-theme="dark"]`) — colour tokens. Dark is the default.
3. **Light theme** (`[data-theme="light"]` + `@media (prefers-color-scheme: light)`) — colour overrides only.

**Only add a token to a theme block if it actually differs between themes.** Tokens that are identical in both themes belong in the invariant block. Using an undefined custom property silently resolves to an empty value (effectively 0 for lengths) — always verify a token exists in the scale before using it.

## Constraints

- **No JavaScript required.** JS may be added as progressive enhancement only — the site must be fully functional without it.
- **AAA WCAG compliance** and keyboard navigation are targets for the finished site.
- **Dark mode is the default.** Light mode must also be fully supported.
- **Modern browsers only** — no legacy polyfills needed.
- **Validate HTML.** The W3C validator is the bar; invalid markup is a bug.
