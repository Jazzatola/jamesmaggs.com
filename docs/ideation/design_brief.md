# Design Brief

Single page, dark, editorial, asymmetric. The design should feel like it was decided, not assembled.

## Colour Scheme

| Role             | OKLCH                  | Notes                          |
|------------------|------------------------|--------------------------------|
| Base             | oklch(26% 0.030 278)   | Near-black navy                |
| Surface          | oklch(33% 0.028 277)   | Raised cards, sidebars         |
| Elevated         | oklch(40% 0.027 275)   | Hover states, overlays         |
| Elevated L1      | oklch(46% 0.026 275)   | Borders on elevated surfaces   |
| Text Primary     | oklch(93% 0.003 248)   |                                |
| Text Secondary   | oklch(79% 0.008 260)   | Labels, metadata               |
| Accent           | oklch(80% 0.158 75)    | Warm amber — used sparingly    |
| Accent D1        | oklch(72% 0.158 75)    | Hover on accent elements       |
| Interactive      | oklch(70% 0.130 230)   | Links, CTAs                    |
| Interactive D1   | oklch(62% 0.130 230)   | Hover on interactive elements  |
| Rule             | oklch(36% 0.020 275)   | Dividers                       |

The amber accent is unusual and memorable. It appears rarely — for the one thing per section that matters most. It is a signal, not a fill.

## Typography

**League Spartan** (geometric sans-serif) — all display text, headings, labels, UI elements, navigation. Weights: 500, 600, 700, 800.

**Bitter** (screen-optimised serif) — body paragraphs, testimonials, italic hooks. Weights: 400 regular and italic.

Both loaded from Google Fonts.

## Icons

Feather Icons — loaded via CDN, stroke-width 2. Used in header and footer for email, LinkedIn, GitHub.

## Section Structure

Four sections in order:

1. **Hero** — "What's Next?" No eyebrow. Tagline. CTA to contact.
2. **Now** — Harness engineering. Significance → philosophy → technique.
3. **Story** — Framing paragraph + 7 milestones + Jos Wilschut testimonial as sidebar.
4. **Contact** — "If you're thinking about what's next too, let's talk."

## Design Principles

1. **Earn every element.** No decorative flourish unless it does a specific job.
2. **Asymmetry over symmetry.** Left-aligned, offset compositions, varied section structures.
3. **The accent is a signal, not a fill.** Amber appears rarely — for the one thing per section that matters most.
4. **Deliberate, editorial motion.** Scroll reveals only. No decorative animation.
5. **Show the person, not the CV.** Craftsmanship, empathy, originality should be felt in the design choices, not just stated in the copy.

## Imagery

Any images should support the "What's Next?" theme — forward-looking, not retrospective. James's photo is used in the contact section.

## Future Consideration

When a writing section is added, it will require a list page and individual post pages. The navigation and layout should not prevent this. Prefer clean semantic HTML that can be templated by a static site generator (Eleventy) later.
