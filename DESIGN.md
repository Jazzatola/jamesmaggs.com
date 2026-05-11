---
version: alpha
name: James Maggs
description: A senior engineer's personal site. Dark slate-blue surfaces, asymmetric editorial layouts, a single warm amber accent used sparingly as a signal.

colors:
  bg-base: '#202333'
  bg-surface: '#313444'
  bg-elevated: '#434757'
  bg-elevated-l1: '#545767'
  text-primary: '#E6E8EA'
  text-secondary: '#B7BBC0'
  accent: '#F8AD2A'
  accent-d1: '#DD9300'
  interactive: '#28ACDF'
  interactive-d1: '#0093C5'
  rule: '#3A3C48'

typography:
  hero:
    fontFamily: '"League Spartan", system-ui, sans-serif'
    fontSize: 'clamp(3.75rem, 11vw, 8.5rem)'
    fontWeight: 700
    lineHeight: 0.95
    letterSpacing: -0.03em
  display:
    fontFamily: '"League Spartan", system-ui, sans-serif'
    fontSize: 'clamp(1.75rem, 3.5vw, 2.75rem)'
    fontWeight: 700
    lineHeight: 1.1
    letterSpacing: -0.02em
  heading:
    fontFamily: '"League Spartan", system-ui, sans-serif'
    fontSize: 1.375rem
    fontWeight: 700
    lineHeight: 1.2
    letterSpacing: -0.01em
  body:
    fontFamily: '"Bitter", Georgia, serif'
    fontSize: 1rem
    fontWeight: 400
    lineHeight: 1.65
  body-lg:
    fontFamily: '"Bitter", Georgia, serif'
    fontSize: 1.125rem
    fontWeight: 400
    lineHeight: 1.85
  pull-quote:
    fontFamily: '"Bitter", Georgia, serif'
    fontSize: 1.125rem
    fontWeight: 400
    lineHeight: 1.8
    fontFeature: 'italic'
  eyebrow:
    fontFamily: '"League Spartan", system-ui, sans-serif'
    fontSize: 0.75rem
    fontWeight: 700
    letterSpacing: 0.14em
  ui-label:
    fontFamily: '"League Spartan", system-ui, sans-serif'
    fontSize: 0.75rem
    fontWeight: 700
    letterSpacing: 0.12em

rounded:
  sm: 3px
  md: 6px
  lg: 12px
  full: 999px

spacing:
  1: 0.25rem
  2: 0.5rem
  3: 0.75rem
  4: 1rem
  5: 1.25rem
  6: 1.5rem
  8: 2rem
  10: 2.5rem
  12: 3rem
  16: 4rem
  20: 5rem
  24: 6rem
  32: 8rem

components:
  button-ghost:
    backgroundColor: transparent
    textColor: '{colors.interactive}'
    typography: '{typography.ui-label}'
    rounded: '{rounded.sm}'
    padding: '0.75rem 1.5rem'
  button-ghost-hover:
    backgroundColor: '{colors.interactive}'
    textColor: '{colors.bg-base}'
  eyebrow:
    textColor: '{colors.accent}'
    typography: '{typography.eyebrow}'
  nav-link:
    textColor: '{colors.interactive}'
    typography: '{typography.ui-label}'
  nav-link-hover:
    textColor: '{colors.interactive-d1}'
  nav-link-current:
    textColor: '{colors.text-primary}'
  site-header:
    backgroundColor: '{colors.bg-base}'
    height: 60px
  contact-photo:
    rounded: '{rounded.lg}'
    width: 280px
  milestone-dot:
    backgroundColor: '{colors.accent}'
    rounded: '{rounded.full}'
    size: 10px
---

## Overview

The site is a personal professional presence for a senior engineer and leader. The audience is sharp technical peers; the question the page exists to answer is "is this person credible, interesting, and worth a conversation?" — so the design is calibrated for restraint and signal, not persuasion.

Three commitments shape every visual decision:

- **Quietly confident.** Long sentences, sober palette, no exclamation points, no superlatives. Copy and visuals carry the same voice.
- **One warm note in a cool room.** A single amber accent against four levels of dark slate-blue. Amber is reserved for signal — section eyebrows, the accented word in the hero headline, milestone dots — at most one element per section.
- **Asymmetry over template.** Each section uses a distinct grid (`2fr 3fr`, `1fr 280px`, a centre-spine zigzag for the timeline). Avoid symmetric icon-left-text-right cards; they read as marketing.

The whole site is one static `public/index.html` with a single `public/styles/main.css`. Tokens live in `:root`; component styles call them by name. There is no framework and no build step. Treat that as a design constraint, not just an engineering one — it keeps the surface honest.

## Colors

The palette has three jobs:

1. **Four bg- levels** (`bg-base` → `bg-elevated-l1`) substitute for shadow-based elevation. Cards and surfaces lift visually by tone, not by drop-shadow.
2. **Two text levels** (`text-primary`, `text-secondary`) — primary near-white for the things you read, secondary for metadata, captions, and quietly receding copy.
3. **Two ramps for two purposes**:
   - `accent` (amber) is a *signal*, not decoration. It marks one thing per section: an eyebrow, a single emphasised word in the hero, a milestone dot, the testimonial quote mark.
   - `interactive` (cyan-blue) is the colour of action: links, ghost-button outlines, focus rings. Distinct hue keeps "you can click this" separate from "look here".

Hover states follow a strict ramp convention — every hover lands on the `-d1` token of whichever ramp the resting state used (links/ghost → interactive-d1, ghost button → fills with interactive, primary → would land on accent-d1). New components must follow the same rule rather than inventing one-off hover colours.

A note on conversion: the source CSS expresses every colour in `oklch()` for perceptual evenness across the ramps. The hex values above are sRGB conversions; for the high-chroma `accent` and `interactive`, an `oklch()`-aware browser on a wide-gamut display will render slightly more saturated than the hex suggests. Treat the hex as the best sRGB equivalent, not the canonical truth.

## Typography

Two voices, deliberately:

- **League Spartan** (geometric sans, 500–800) for everything load-bearing in the UI: hero, section titles, milestone headlines, eyebrow labels, navigation, button text, the footer line.
- **Bitter** (slab-leaning serif, 400 + italic) for everything you actually read: prose paragraphs, pull-quotes, milestone bodies.

The contrast between the two — geometric structure vs. warm reading serif — is the central typographic decision. A third typeface erodes it. Do not introduce one.

The hero and section titles use `clamp()` to scale fluidly with viewport. The DESIGN.md spec's `Dimension` type doesn't formally cover `clamp()`, so those `fontSize` values are emitted as quoted strings — interpret them as live CSS expressions, not static dimensions.

Letter-spacing is the workhorse for tone:

- Negative tracking (`-0.02em` to `-0.03em`) on display sizes — pulls oversized headings together so they read as confident, not airy.
- Wide tracking (`0.10em`–`0.14em`) plus uppercase on League Spartan at small sizes — the "label" voice for eyebrows and nav.

## Layout

- **Container**: max-width `1100px`, horizontal padding `spacing.8` (1rem on the smallest viewports, stepped down via media query). Centred, never wider.
- **Vertical rhythm**: every full section uses `spacing.24` (6rem) of top/bottom padding and is separated by a 1px `rule`-coloured hairline. The rhythm is what makes the asymmetric per-section grids hang together.
- **Section grids** vary on purpose:
  - Welcome / Now: `2fr 3fr` — title in the narrower column, prose in the wider one. Reads left-to-right like an editorial spread.
  - Story: a centre-spine zigzag with milestones alternating left and right of a vertical rule.
  - Contact: `1fr 280px` — copy on the left, a portrait photo on the right.
- **Header**: fixed at 60px, `bg-base` background, hairline bottom border. The `.scrolled` state replaces the bottom border with `bg-elevated` and adds the elevation shadow described below.
- **Mobile collapse**: at `768px` the multi-column grids collapse to a single column and the timeline drops its centre spine; below `640px` the container padding tightens to `spacing.4`. There is no hamburger menu — the nav stays inline because the link count is small.

## Elevation & Depth

Elevation is mostly *avoided*. Lift is conveyed through the four `bg-` tokens (base → surface → elevated → elevated-l1), not through stacked shadows. There is one explicit shadow:

- **Header on scroll**: `0 8px 32px -4px oklch(14% 0.025 278 / 0.6)` — a deep, blurred, low-opacity wash that reads as "the header is now floating", not "the header is a card". Reuse this exact value for any other surface that needs to detach on scroll; do not invent a second shadow scale.

Cards, modals, and pop-overs (when added) should prefer a `bg-elevated` swap over a shadow.

## Shapes

Four radii — restrained, with deliberate jobs:

- `sm` (3px): outline buttons, the skip-link. Almost square; reinforces the engineering-tool aesthetic.
- `md` (6px): mid-weight UI surfaces if needed.
- `lg` (12px): the contact photo frame — soft enough to feel humane, not playful.
- `full` (999px): the milestone dot, and any future pills.

No component uses a `2xl` or fully-rounded "iOS card" radius. Don't add one.

## Components

- **`button-ghost`** — outlined CTA in `interactive`, transparent fill, `rounded.sm`. On hover the fill becomes `interactive` and the text inverts to `bg-base`. Used for the hero CTA and the contact CTA. It's the only button pattern; if you need a primary-filled button later, build it as `button-primary` with `accent` as the fill, and put the hover state on `accent-d1`.
- **`eyebrow`** — uppercase small-caps label in `accent`, sits above a section title. This is the amber's main job; treat each instance as the section's "one signal".
- **`nav-link`** — uppercase ui-label in `interactive`, hover lands on `interactive-d1`. The `aria-current="true"` variant promotes to `text-primary` and removes the underline — current page is louder than the rest, but stays in the neutral palette.
- **`site-header`** — fixed, 60px tall, `bg-base`. Pairs with the elevation shadow above when scrolled.
- **`contact-photo`** — `rounded.lg` portrait frame with a thin `bg-elevated-l1` border. The only place a photograph appears.
- **`milestone-dot`** — solid `accent`-coloured circle (10px) with a 3px `bg-base` ring punching through the timeline rule. Story section only.

Variants follow the spec's pattern of related-key naming (`button-ghost` / `button-ghost-hover`, `nav-link` / `nav-link-hover` / `nav-link-current`) rather than nested state objects.

## Do's and Don'ts

**Do**

- Use the amber `accent` as a signal — at most one element per section. Eyebrow, single hero word, milestone dot, testimonial mark.
- Keep hover states inside the existing ramps (links/ghost → `interactive-d1`, ghost button → fills with `interactive`, primary → `accent-d1`).
- Vary section layouts. Asymmetric, left-aligned compositions are the house style.
- Match the copy voice in any new content: long sentences, no exclamation points, no superlatives, no buzzwords.
- Read tokens from `:root` — never hardcode hex, font names, or spacing values at the call site.

**Don't**

- Don't introduce a third typeface. League Spartan + Bitter is the system; a third voice flattens the contrast.
- Don't apply `accent` to interactive elements. Interactive is a separate cool-blue ramp; mixing them collapses the "signal vs. action" distinction.
- Don't add drop-shadows to cards or surfaces. Use a `bg-` level swap for elevation. The header scroll shadow is the only stacked shadow in the system.
- Don't add a build step, framework, or bundler. The whole site is plain HTML/CSS with one inline `<script>`. New CDN dependencies need a strong reason; the current set is Google Fonts and feather-icons only.
- Don't reach for symmetric icon-left-text-right templates. They read as marketing.
