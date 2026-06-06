# 138labs-landing

Static landing page for `138labs.de`.

## Repo structure

- `index.html`: current landing page
- `index-v2.html`: second UX/copy iteration
- `index-v3.html`: active draft with stronger narrative, examples, and visual direction
- `impressum.html`: legal page
- `docs/`: concept, content, and deployment notes

## Checkpoint workflow

For landing page exploration, keep physical HTML checkpoints:

- `index.html`: V1 checkpoint
- `index-v2.html`: V2 copy refinement
- `index-v3.html`: active refinement draft

When a newer draft becomes the new baseline, either:

- promote it to `index.html` intentionally
- or keep iterating with `index-v4.html`, `index-v5.html`, and so on

## Recommended workflow

Use one codebase with two deployment targets:

- `main` -> production in Coolify
- `develop` -> dev/staging in Coolify

That keeps the site simple while still letting you publish intermediate states safely.

## Docker

The current deployment is a static nginx container:

```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
```

For repo hygiene, deployment notes live in `docs/` and should not be copied into the runtime image.

## Next docs

- [Landing Page Concept](docs/landing-page-concept.md)
- [Content Roadmap](docs/content-roadmap.md)
- [Coolify Deployment Workflow](docs/coolify-deployment-workflow.md)
