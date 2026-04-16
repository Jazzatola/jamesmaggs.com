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

Every push to `main` triggers `.github/workflows/deploy.yml`, which runs `flyctl deploy --remote-only` using the `FLY_API_TOKEN` GitHub secret. Deploys take ~45 seconds.

To deploy manually from the CLI:
```bash
flyctl deploy --remote-only
```

## Architecture

```
public/          # Site content — everything served to browsers
Dockerfile       # caddy:2-alpine; copies Caddyfile + public/ into image
Caddyfile        # Caddy config: serves public/ on :8080, apex redirect,
                 # gzip/zstd, 404 handler, security headers
fly.toml         # Fly.io app config (app: jamesmaggs-com, region: lhr)
```

Fly.io handles TLS termination and forwards plain HTTP to Caddy on port 8080. The `Host` header is preserved, which is how the apex→www redirect in the Caddyfile works.

The apex domain `jamesmaggs.com` issues a 301 redirect to `https://www.jamesmaggs.com`. All canonical content lives at `www`.

## Constraints

- **No JavaScript required.** JS may be added as progressive enhancement only — the site must be fully functional without it.
- **AAA WCAG compliance** and keyboard navigation are targets for the finished site.
- **Dark mode is the default.** Light mode must also be fully supported.
- **Modern browsers only** — no legacy polyfills needed.
- **Validate HTML.** The W3C validator is the bar; invalid markup is a bug.
