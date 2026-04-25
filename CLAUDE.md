# CLAUDE.md

This is a personal portfolio website for James Maggs, that showcases his work as a software engineer, manager and leader over the past 25+ years. It is a static, single-page website built with standards compliant html, css and javascript with no dependencies on libraries or frameworks.

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
Recruiters, potential employers, and former colleagues — people who encounter this site after receiving a referral, finding a CV, or seeing James mentioned somewhere. They are visiting during a professional evaluation moment: assessing whether he's worth a conversation. Context: likely desktop, during work hours, briefly scanning before deciding to read more deeply. The job to be done is: "Is this person credible, interesting, and worth reaching out to?"

### Brand Personality
**3 words: exact, human, ahead.**

Not "modern", not "elegant". Exact: his writing is precise and unsentimental, no wasted words. Human: he leads with empathy and people, not credentials and achievements. Ahead: the narrative is explicitly about the future, about agentic AI, about what's coming next.

Emotional goal: a visitor should leave with the feeling "this person brings something different — and I want to talk to them." Not impressed, not dazzled — *curious* and *convinced*.

Tone: quietly confident. No exclamation points. No superlatives. No buzzwords.

### Aesthetic Direction
**Dark, editorial, asymmetric.** Dark because it signals focus, precision, and seriousness. Palette: navy/slate backgrounds with a warm amber accent (oklch(80% 0.158 75)). The amber is unusual and memorable — most dark portfolios reach for cyan or purple.

**Primary reference:** `docs/inspiration/carlos_mendoza.png` — strong asymmetric layouts, bold display type, yellow/amber accents used sparingly, photography prominently featured, stats displayed as moments, clear section rhythm without monotony.

**Anti-reference:** Generic dark developer portfolios — cyan-on-dark, purple gradients, icon-left-text-right template layouts.

**Typography pairing:** League Spartan (primary, already implemented) as the geometric sans. Open to adding a contrasting editorial serif for body text. Look at Gloock, Libre Caslon Display, or similar editorial-weight serifs — nothing from the impeccable reflex-banned list.

### Design Principles

1. **Earn every element.** No decorative flourish unless it does a specific job.
2. **Asymmetry over symmetry.** Left-aligned, offset compositions, varied section structures.
3. **The accent is a signal, not a fill.** Amber appears rarely — for the one thing per section that matters most.
4. **Deliberate, editorial motion.** A few well-placed reveals and hover states, executed with restraint. Motion was *decided*, not applied.
5. **Show the person, not the CV.** Craftsmanship, empathy, originality should be felt in the design choices, not just stated in the copy.