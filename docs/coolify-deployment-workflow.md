# Coolify Deployment Workflow

## Recommendation

Do not model `dev` and `prod` as separate folders with duplicated site files.

Use:

- one repository
- one shared codebase
- two branches
- two Coolify services

## Branch model

- `main`: production-ready state
- `develop`: dev/staging state

Optional later:

- short-lived feature branches from `develop`

## Coolify setup

Create two apps/services in Coolify pointing to the same repo:

### Production service

- branch: `main`
- domain: `138labs.de` or `www.138labs.de`
- auto-deploy: enabled

### Dev/staging service

- branch: `develop`
- domain: for example `dev.138labs.de` or `staging.138labs.de`
- auto-deploy: enabled
- optional basic auth: enabled

Basic auth on staging is useful if you do not want unfinished states to be public.

## Why this is the right tradeoff here

The repo is currently a static nginx site. Separate `dev/` and `prod/` directories would create:

- duplicated files
- accidental drift between environments
- more confusing deploy behavior
- unnecessary maintenance

Branch-based separation gives you:

- clean preview flow
- low operational complexity
- easy rollback
- direct compatibility with Coolify auto-builds

## Suggested working routine

1. Work on `develop`
2. Push intermediate states to `develop`
3. Coolify deploys staging automatically
4. Review in browser
5. Merge `develop` into `main`
6. Coolify deploys production automatically

## Optional additions

### Add staging protection

Recommended if staging is public:

- Coolify basic auth
- no indexing via `X-Robots-Tag` or `robots.txt`

### Add environment labels

Even for a static page, you can visually mark staging:

- small `DEV` badge in a corner
- only enabled in staging build later if needed

That is optional and only worth doing if dev and prod begin to diverge during review.

## Repo-level conventions

Recommended structure:

- runtime files at repo root
- documentation in `docs/`
- no duplicated environment directories for site code

## If the site grows later

When the project becomes larger, the next step is not `dev/` and `prod/` folders.

The next step is usually one of these:

- introduce a small static-site toolchain
- add templates/components
- add CI checks before deploy

Until then, keep it flat.
