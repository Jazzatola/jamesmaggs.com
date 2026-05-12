# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

James Maggs' personal professional presence site — a long-horizon platform aimed at sharp technical peers (engineers, leaders, builders), with recruiters as a secondary audience. The job to be done: *"Is this person credible, interesting, and worth a conversation?"*

It is **a static HTML page** (`public/index.html`) with one external stylesheet (`public/styles/main.css`) and a small inline `<script>`. No build step, no framework, no package manager, no dependencies beyond two CDN-loaded assets (Google Fonts, feather-icons).

## Architecture

- `public/index.html` — markup for the entire site. Loads `/styles/main.css` via `<link>`. Inline `<script>` at the bottom handles reveal-on-scroll, scroll-spy nav highlighting, and feather icon replacement.
- `public/styles/main.css` — all styles. Design tokens (`:root` custom properties — palette, type scale, spacing scale, easings) at the top, component styles below.
- `public/404.html` — error page; served by Caddy via `handle_errors`.
- `public/images/` — only place static image assets live.
- `assets/` — local working drafts (e.g. `copy.md` while iterating on site copy). Untracked in git and not served by Caddy.
- `Caddyfile` — serves `public/` on `:8080`, redirects apex → `www`, sets security headers, gzip/zstd, and rewrites 404s to `/404.html`.
- `Dockerfile` — `caddy:2-alpine` + `Caddyfile` + `public/`. That's the whole image.
- `fly.toml` — single Fly.io app (`jamesmaggs-com`), region `lhr`, scales to zero (`auto_stop_machines = "stop"`, `min_machines_running = 0`).
- `.github/workflows/deploy.yml` — deploys on push to `main` **only when `public/**`, `Dockerfile`, `Caddyfile`, or `fly.toml` changes**. Edits to docs, CLAUDE.md, etc. will not trigger a deploy.

Site sections (in order): **Hero → Now → Story → Contact**. Nav: Now · My Story · Contact. A **Projects** section is planned between Now and Story to back up the agentic-engineering claims with verifiable artefacts; not yet built.

## Common tasks

There are no scripts, lint, or tests. Common commands:

- **Preview locally** — open `public/index.html` directly in a browser, or run any static server from `public/` (e.g. `python3 -m http.server 8000`).
- **Run the production image locally** — `docker build -t jamesmaggs . && docker run -p 8080:8080 jamesmaggs`, then visit `http://localhost:8080`.
- **Deploy** — push to `main` (CI handles it). Manual deploy: `flyctl deploy --remote-only`.
- **Manual workflow trigger** — `gh workflow run deploy.yml`.

## Design system (do not drift)

Tokens live in `:root` at the top of `public/styles/main.css` — change them there, not at call sites.

- **Palette**: dark navy/slate backgrounds (`--bg-base` etc.) with a single warm amber accent `oklch(80% 0.158 75)`. Amber is a *signal*, used sparingly — one element per section at most.
- **Typography**: League Spartan (display, 500–800) for headings/labels/UI; Bitter (serif, 400 + italic) for body and pull quotes. Do not introduce other typefaces.
- **Hover states**: CTA buttons → D1 shade of base colour (e.g. solid CTAs go `--interactive` → `--interactive-d1`). Text links → underline appears on hover; muted inline links (e.g. footer Claude credit) inherit the surrounding colour and only show the underline on hover.
- **Layout**: asymmetric, left-aligned, varied per section. Avoid symmetric icon-left-text-right templates.
- **Tone in copy**: quietly confident. No exclamation points, superlatives, or buzzwords.

## Conventions

- Tabs for indentation in `index.html` and `main.css` (match existing).
- No build step, no bundler, no framework. Plain HTML/CSS/JS only. The small JS lives inline in `index.html`; CSS lives in `public/styles/main.css`.
- New external dependencies (CDN scripts, fonts) need a strong reason; the current set is feather-icons and Google Fonts only.
- Commits use sentence-case imperative subjects (see `git log`). Prefix with `[claude]` only for changes inside `.claude/` or to this `CLAUDE.md`.
- Email addresses (`mailto:james@jamesmaggs.com`) appear plain in the markup. No obfuscation: the address is already public elsewhere and obfuscation breaks UX without meaningfully deterring modern scrapers.
