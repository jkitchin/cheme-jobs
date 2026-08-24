You are producing a **chemical engineering internship board** — a single
markdown report that a student can skim on a phone and act on the same day.
Today's date is **{{TODAY}}**. Write your final report to `{{OUTFILE}}` in the
current repository (create parent directories if needed) — reports are named by
the month-day-year they are compiled, so this run's file is `{{STAMP}}.md`. Do
not modify any other file.

## Audience

Chemical engineering students at Carnegie Mellon: mainly undergraduates
(sophomores/juniors) hunting summer internships and co-ops, plus MS/PhD students
looking for graduate industrial internships. US-focused; include notable
international programs but label them clearly.

## Work the search hard

Use WebSearch aggressively — **at least 25 distinct queries** — and WebFetch to
open the actual requisition and program pages so you can read the real
eligibility text, requisition numbers, pay, and dates. Angles to cover:

- Company early-careers portals (Workday/Taleo/SuccessFactors) searched by the
  next cycle's year: `"2027 intern" chemical engineering <company>`.
- Refining, midstream, and energy — these post earliest and are ChemE-dense.
- Chemicals, materials, industrial gases; semiconductors (search
  **process engineer, process integration, yield, thin films, etch, CMP** — fabs
  hire ChemEs under titles that never say "chemical").
- Pharma/biotech (search **process development, drug substance, technical
  operations, MSAT**), consumer products and food (search **plant technical**).
- Environment/water consulting and equipment; climate tech via aggregator boards.
- National labs and federal programs — these have the only real deadlines.
- NSF REU sites; graduate/PhD-specific industrial requisitions; co-op programs
  (multi-semester, different timeline from summer).
- Fellowship and pipeline programs (INROADS, AIChE WISE/RAPID, and similar).

Prefer primary sources. Where a listing only exists on an aggregator, say so and
mark it a lead rather than a characterized posting.

## Format — this is a board of listing cards, not a wall of tables

Follow this structure exactly.

### Masthead

    `COMPILED {{TODAY}} · <the cycle, e.g. SUMMER / SPRING 2027> · US POSTINGS`

    # Chemical Engineering Internship Board

    <A 2-4 sentence lede describing the state of the cycle right now: which
    sectors are live, which land later, whether a federal deadline is close.>

Then a nearest-deadline callout as a blockquote:

    > **NEAREST HARD DEADLINE — <N> DAYS OUT**
    > **<Program>** closes **<date and time>**. <One or two sentences on what
    > that deadline actually means — late materials, recommendation cutoffs,
    > whether everything else on the board is rolling.>

Then a four-cell stat row as a small table: postings and programs listed · fixed
deadlines in the next 60 days · number opening between <month> and <month> ·
number verified by an actual live page load this session. **Report that last
number honestly, including when it is 0.**

### Sections

`## ` heading per area, ordered **by how actionable they are right now** — the
sections with hard deadlines and live requisitions first, "not posted yet" last.
Use whatever areas the findings actually support; typical set:

Federal labs and fellowships · Refining, midstream and energy · Semiconductors
and electronic materials · Chemicals, materials and consumer products · Pharma,
biotech and consulting · Environment, water and climate tech · Undergraduate
research (REU) · Graduate and PhD routes

Under each `##`, write **2-3 sentences of judgment** about that sector — what is
live, what the common disqualifier is, what is worth the reader's next hour.
Not a summary of the rows below; an actual claim.

### One card per listing

    ### <Organization, or several joined by ·> — <role title as posted>
    `<locations · req/job numbers>`

    <One paragraph, 3-6 sentences, of real substance: what the work actually is
    (unit operations, process control, scale-up, yield, permitting…), how the
    program is structured, and any trap — a requisition that requires a prior
    internship, one closed to first-time applicants, an undated req, a
    2026-labelled posting that may be stale, a required prior work term.>

    [<readable link text — domain plus req number>](<url>)

    `<STATUS BADGE>` `<second badge if needed>`

    | | |
    |---|---|
    | **Deadline** | … |
    | **Citizen** | … |
    | **GPA** | … |
    | **Level** | … |
    | **Terms** | … |

Badge vocabulary — pick the honest one:

`LIVE` · `ROLLING` · `ROLLING REVIEW` · `HARD DEADLINE` · `NOT YET POSTED` ·
`VERIFY SEASON` (undated or ambiguous-year req) · `TERM UNKNOWN` ·
`RETURNERS ONLY` · `LIKELY CLOSED` · `LEADS — DETAILS UNCONFIRMED` ·
`NOT VERIFIED` (page blocked or unreachable) · `SPANS TWO TERMS`

Fact-block rules:

- **Deadline** — an explicit date when stated. Otherwise the literal truth:
  `Not stated; closes when filled`, `Rolling`, `Not stated`. If you are
  inferring from a prior cycle, write `~Nov 2026 (prior-cycle est.)`.
- **Citizen** — the most important field on the board. Quote the restriction:
  which visa classes are excluded, whether sponsorship exists, whether a
  clearance or federal credential is required, export-control language.
  `Not stated` when the page is silent.
- **GPA** — the number and whether it is a minimum or a preference.
- **Level** — degree, class year, graduation-date window, credit-hour minimums,
  and physical requirements (respirator/clean-shaven, TWIC, driver's licence,
  drug screen, relocation).
- **Terms** — length, dates, pay, housing.

Omit a row only when it would be pure noise. Group thin leads into a single
card titled like *Additional 2027-dated postings* with the
`LEADS — DETAILS UNCONFIRMED` badge rather than making a card per rumor.

### Closing

- `## How to use this board` — 4-6 bullets of timing advice specific to this
  point in the cycle.
- `## Sources` — split into pages you actually fetched and read, versus hubs and
  aggregators used only for timing.
- `## Caveats` — pages that blocked retrieval, sectors that came up thin, what
  you did not cover, and a plain statement that deadlines change and the linked
  page is the authority.

## Accuracy rules — these outrank completeness

- Never invent a program, URL, requisition number, deadline, or pay figure.
  Every card must trace to a page you saw this session.
- A stated fact and your estimate must never look alike. Estimates carry
  `est.` and name their basis.
- If a page 403s, 404s, or returns nothing, either drop the card or keep it with
  the `NOT VERIFIED` badge and say so in the fact block.
- Call out traps explicitly. A returners-only requisition or a stale
  2026-labelled posting that reads as current is exactly the kind of thing this
  board exists to catch.
- Aim for **25-45 cards**. Depth per card beats row count — a card with real
  work description and a complete fact block is worth five bare table rows.
- Prefer a small number of ruthlessly verified cards over a long list of
  half-checked ones, and say in the caveats what you had to leave out.

Work through the searches, then write `{{OUTFILE}}` in one pass. Finish by
printing a two-line summary: the card count, and any section that came up empty.
