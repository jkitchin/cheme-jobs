# cheme-jobs

Automated monthly searches for **chemical engineering internships** and
**full-time ChemE jobs**, run by Claude Code in GitHub Actions.

| | Internships | Jobs |
|---|---|---|
| Current board (overwritten each run) | [`INTERNSHIPS.md`](INTERNSHIPS.md) | [`JOBS.md`](JOBS.md) |
| Snapshot of every run, `MM-DD-YYYY.md` | [`archive/`](archive/) | [`jobs-archive/`](jobs-archive/) |
| Search spec: what's searched, layout, accuracy rules | [`prompts/internship-search.md`](prompts/internship-search.md) | [`prompts/job-search.md`](prompts/job-search.md) |
| Schedule | [`internship-search.yml`](.github/workflows/internship-search.yml) | [`job-search.yml`](.github/workflows/job-search.yml) |

The job board covers full-time, entry- and early-career roles for people with
ChemE degrees, sectioned by degree (BS / MS / PhD) and sector (industry /
government / academic). Both schedules call the shared
[`board-search.yml`](.github/workflows/board-search.yml), which holds the Claude
invocation and the commit logic.

Both boards are published at **https://kitchingroup.cheme.cmu.edu/cheme-jobs/**,
with the job board at [`jobs.html`](https://kitchingroup.cheme.cmu.edu/cheme-jobs/jobs.html)
and past runs under each board's archive.
[`.github/workflows/pages.yml`](.github/workflows/pages.yml) renders the
markdown with pandoc ([`site/`](site/) holds the template, CSS, and Lua filter)
after every search run and on any push that touches the listings. Preview
locally with `site/build.sh` and open `_site/index.html`.

## Schedule

The internship search runs at midnight UTC on the 1st of each month and the job
search on the 15th. Both can also be run on demand from the Actions tab
(**Monthly ChemE internship search** or **Monthly ChemE job search → Run
workflow**). The manual run takes a
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

Runs are capped by `--max-budget-usd`: 25 for internships and 30 for jobs (the
`max_budget_usd` input in each schedule). Raise it if a run gets truncated.

## How the run is sandboxed

Claude gets only `WebSearch`, `WebFetch`, `Read`, `Write`, `Edit`, `Glob`,
`Grep`, and `TodoWrite` — no `Bash` — and the prompt tells it to write exactly
one file (`<archive dir>/<MM-DD-YYYY>.md`). The workflow, not Claude, copies that
to the current board, regenerates the archive's `INDEX.md`, and pushes.

## Caveats

Listings are machine-collected. Deadlines and eligibility rules change without
notice — **always confirm on the linked page before relying on a date.** Rows
marked `est.` are inferred from a previous cycle, not stated by the employer.

## Tuning the search

Edit `prompts/internship-search.md`. It controls the sections, the card format
and status badges, the eligibility details to capture, and the "don't invent
anything" rules. No workflow changes needed.
