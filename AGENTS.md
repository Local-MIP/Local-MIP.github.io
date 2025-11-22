# Repository Guidelines

## Project Structure & Module Organization
- Root `*.md` pages (for example `index.md`, `quick-start.md`, `software.md`) form the site content; each requires YAML front matter with `layout` and `title`.
- `_config.yml` holds Jekyll settings, navigation, and plugin lists; update nav entries here when adding pages.
- `assets/css/style.scss` customizes the Minima theme; keep styles minimal and mobile-friendly. Images live in `assets/images/`.
- `submodules/solver` tracks the upstream Local-MIP solver; refresh via `update-solver.sh`.
- `_site/` and `vendor/` are build outputs/dependencies—do not edit manually or commit generated files.
- GitHub Pages deployment is configured in `.github/workflows/pages.yml`.

## Build, Test, and Development Commands
- Install dependencies: `bundle install` (uses Ruby 3.1 via `ruby/setup-ruby` in CI).
- Local preview: `bundle exec jekyll serve` then browse `http://localhost:4000`.
- Build for validation: `bundle exec jekyll build`; ensures front matter and Markdown render without errors.
- Update solver submodule: `bash update-solver.sh`.

## Coding Style & Naming Conventions
- Author content in GitHub-flavored Markdown; prefer relative links (`/software`) over hard-coded hosts.
- Keep headings concise and sequential (`##` after `#`), and use fenced code blocks with a language hint (```bash).
- Front matter keys are lowercase with hyphens (`title`, `layout`, `description`); avoid duplicating titles inside content unless needed.
- SCSS follows two-space indentation; limit page-specific inline styles to small, focused snippets like the hero buttons in `index.md`.

## Testing Guidelines
- Run `bundle exec jekyll build` before pushing; it will surface missing front matter, plugin issues, and Markdown errors.
- For link checks, spot-check new pages in `jekyll serve` output; keep external URLs live and prefer HTTPS.
- No automated unit tests are present; rely on clean builds and manual review of rendered pages.

## Commit & Pull Request Guidelines
- Commit messages follow the existing pattern: short, imperative summaries (e.g., “Add quick start page”, “Remove enablement parameter”).
- In PRs, include: a short description of the change, any linked issues, steps to reproduce/verify (commands run), and screenshots or preview URLs for visual changes.
- Keep diffs focused: avoid mixing content edits with dependency updates unless required for the change.

## Security & Configuration Tips
- Do not commit secrets or tokens; this site uses only public data.
- When changing `_config.yml`, ensure `header_pages` stays in sync with available pages and avoid altering `url/baseurl` unless coordinating with deployment.***
