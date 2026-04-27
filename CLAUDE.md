# CLAUDE.md

This is a personal professional presence site for James Maggs — a long-horizon platform that communicates who he is, where he's been, and how he thinks about what's next in software engineering. It is a static, single-page website built with standards compliant html, css and javascript with no dependencies on libraries or frameworks.

The site is deployed on Fly.io with CI/CD via GitHub Actions.

## Research

Initial project research was performed before this build and is available in the docs directory:

- [Client Brief](./docs/ideation/client_brief.md) - describes the overall project direction, objectives and target audience.
- [Idea Brief](./docs/ideation/idea_brief.md) - clarifies the purpose and goals, defines why the website is being built.
- [Design Brief](./docs/ideation/design_brief.md) - translates strategy into design direction, guiding the visual execution and user experience.
- [Technical Brief](./docs/ideation/technical_brief.md) - defines the technology stack and outlines system architecture.

A [design system](./docs/design-system.html) has been developed as the basis for the design.

## Content

An initial idea of the [site content](./docs/content.md) has also been provided.

## Design Context

### Users
Primary: sharp technical peers — engineers, leaders, and builders serious about where software engineering is going. They arrive via referral, LinkedIn, or a CV. They are evaluating whether James is someone worth knowing and thinking alongside.

Secondary: recruiters and potential employers. The site should work for them without being optimised for them first.

Context: likely desktop, during work hours, briefly scanning before deciding to read more deeply. The job to be done: "Is this person credible, interesting, and worth a conversation?"

### Brand Personality
**3 words: exact, human, ahead.**

Not "modern", not "elegant". Exact: his writing is precise and unsentimental, no wasted words. Human: he leads with empathy and people, not credentials and achievements. Ahead: the narrative is explicitly about the future, about agentic AI, about what's coming next.

Emotional goal: a visitor should leave thinking *"this person has seen it all, knows what's real, and I want to talk to them."* Not impressed, not dazzled — *curious* and *convinced*.

Tone: quietly confident. No exclamation points. No superlatives. No buzzwords.

The site is a long-horizon professional presence, not a hire-me page. The contact CTA filters for the right people: *"If you're thinking about what's next too, let's talk."*

### Aesthetic Direction
**Dark, editorial, asymmetric.** Dark because it signals focus, precision, and seriousness. Palette: navy/slate backgrounds with a warm amber accent `oklch(80% 0.158 75)`. The amber is unusual and memorable — most dark portfolios reach for cyan or purple.

**Typography and spacing are the visual signature.** These are the most important elements — the thing someone should remember. Every sizing, weight, tracking, and spacing decision should be deliberate and precise.

**Typography pairing (established, do not replace):**
- **League Spartan** (geometric sans, 500–800 weight): all display, headings, labels, UI text, navigation.
- **Bitter** (screen-optimised serif, 400 regular + italic): all body paragraphs, running text, pull quotes.

**Primary reference:** `docs/inspiration/carlos_mendoza.png` — strong asymmetric layouts, bold display type, amber accents used sparingly, clear section rhythm without monotony.

**Anti-reference:** Generic dark developer portfolios — cyan-on-dark, purple gradients, icon-left-text-right template layouts.

### Site Structure (current)

Four sections in order: Hero → Now → Story → Contact. Nav: Now · Story · Contact.

- **Hero**: "What's Next?" — no eyebrow, just the question.
- **Now**: Harness engineering — significance → philosophy → technique. Asymmetric two-column layout (heading left, body right).
- **Story**: Framing paragraph + 7 career milestones + Jos Wilschut testimonial as sticky sidebar pull-quote.
- **Contact**: "If you're thinking about what's next too, let's talk." Photo of James on right.

### Design Principles

1. **Typography and spacing carry the design.** The visual signature. Every decision should be deliberate and precise — add space above rather than decoration around.
2. **Earn every element.** No decorative flourish unless it does a specific job.
3. **Asymmetry over symmetry.** Left-aligned, offset compositions, varied section structures.
4. **The accent is a signal, not a fill.** Amber appears rarely — for the one thing per section that matters most.
5. **Show the person, not the CV.** Craftsmanship, empathy, originality should be felt in the design choices, not just stated in the copy.