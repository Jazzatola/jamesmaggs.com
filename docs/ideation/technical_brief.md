# Technical Brief

- The source code itself is part of the product. The site should be standards compliant with clean, easy to read markup.
- This is a static site with no dependency on any language, framework, or build tool. Vanilla HTML, CSS, and JavaScript only.
- The site should be fully functional without JavaScript. JavaScript provides an additional layer of polish (scroll reveals, header state, active nav tracking) but is not required.
- Targeted at modern browsers. Latest HTML, CSS, and JavaScript standards are in scope.
- All colours specified in oklch format.
- AA WCAG compliance with full keyboard navigation support.
- Code hosted on GitHub with GitHub Actions for CI/CD.
- Hosted on [Fly.io](https://fly.io/).
- Domain: [www.jamesmaggs.com](https://www.jamesmaggs.com/)

## SEO & Analytics

- People searching for James Maggs should find this site.
- Structured data (JSON-LD) for name, job title, and relevant schema.
- Open Graph and Twitter Card support.
- Meta description and title tag should reflect the professional presence framing, not the CV framing.

## Future: Writing Section

When a writing section is added, the preferred path is **Eleventy** as a static site generator. The output remains static HTML — the constraint being relaxed is in build tooling, not the delivered site. The current HTML structure should remain clean and semantic enough to be templated without significant rework.

Do not introduce a build step or dependencies until writing is actually being published.
