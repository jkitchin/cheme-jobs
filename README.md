# cheme-jobs

Automated monthly search for **chemical engineering internships**, run by Claude
Code in GitHub Actions.

- [`INTERNSHIPS.md`](INTERNSHIPS.md) — the current listing (overwritten each run)
- [`archive/`](archive/) — a snapshot of every run, named `MM-DD-YYYY.md` for
  the day it was compiled
- [`prompts/internship-search.md`](prompts/internship-search.md) — the search
  spec: what gets searched, how it's organized, and the accuracy rules
- [`.github/workflows/internship-search.yml`](.github/workflows/internship-search.yml)
  — the schedule and the Claude invocation

## Schedule

Runs at midnight UTC on the 1st of each month, and on demand from the Actions tab
(**Monthly ChemE internship search → Run workflow**). The manual run takes a
`model` input and a `commit` toggle if you want to test without writing to the
repo.

> GitHub disables scheduled workflows in a repo with 60 days of no activity. The
> monthly commit normally keeps this alive; if the schedule ever goes quiet,
> re-enable it from the Actions tab.

## Setup

One repo secret is required. Either works — the workflow prefers the OAuth token.

**Option A — Claude subscription token** (uses your Claude plan):

```bash
claude setup-token                                   # prints a long-lived token
gh secret set CLAUDE_CODE_OAUTH_TOKEN --repo jkitchin/cheme-jobs
```

**Option B — Anthropic API key** (billed per token):

```bash
gh secret set ANTHROPIC_API_KEY --repo jkitchin/cheme-jobs
```

The run is capped at `--max-budget-usd 25`; adjust in the workflow if a run gets
truncated.

## How the run is sandboxed

Claude gets only `WebSearch`, `WebFetch`, `Read`, `Write`, `Edit`, `Glob`,
`Grep`, and `TodoWrite` — no `Bash` — and the prompt tells it to write exactly
one file (`archive/<MM-DD-YYYY>.md`). The workflow, not Claude, copies that to
`INTERNSHIPS.md`, regenerates `archive/INDEX.md`, and pushes.

## Caveats

Listings are machine-collected. Deadlines and eligibility rules change without
notice — **always confirm on the linked page before relying on a date.** Rows
marked `est.` are inferred from a previous cycle, not stated by the employer.

## Tuning the search

Edit `prompts/internship-search.md`. It controls the sections, the card format
and status badges, the eligibility details to capture, and the "don't invent
anything" rules. No workflow changes needed.
