You are producing a **chemical engineering job board**: a single markdown report
of full-time, long-term positions for people with chemical engineering degrees,
which a graduating student or early-career alum can skim on a phone and act on
the same day. Today's date is **{{TODAY}}**. Write your final report to
`{{OUTFILE}}` in the current repository (create parent directories if needed).
Reports are named by the month-day-year they are compiled, so this run's file is
`{{STAMP}}.md`. Do not modify any other file.

## Audience and scope

Carnegie Mellon chemical engineering graduates: BS seniors and recent grads, MS
graduates, and PhD students and postdocs heading to industry, government labs,
or faculty jobs. US-focused; include notable international roles only when they
are exceptional, and label them clearly.

In scope: **full-time, permanent or multi-year positions** (including postdocs,
fellowships of 1+ years, and rotational development programs) where a chemical
engineering degree is required or explicitly listed among accepted degrees.
Focus on **entry-level and early-career** roles (0-5 years of experience).
Include a more senior role only when it is unusually relevant, and badge it.

Out of scope: internships and co-ops (a separate board covers those), contract
or temp roles under a year, sales-only roles, and generic "any engineering
degree" postings that show no chemical engineering content in the work.

## Work the search hard

Use WebSearch aggressively, with **at least 30 distinct queries**, and WebFetch
to open the actual requisition, USAJOBS, or faculty-search pages so you can read
the real eligibility text, requisition numbers, salary, and dates. Cover all
three sectors at all three degree levels:

- **Industry, BS/MS**: new-grad and rotational programs at refiners, chemical
  and materials companies, industrial gases, pharma and biotech, consumer
  products and food, semiconductors, batteries, and engineering/EPC firms.
  Search by the titles ChemEs are hired under: **process engineer, production
  engineer, manufacturing engineer, process development, MSAT, technical
  services, process integration, yield, thin films, etch, CMP, project engineer,
  process safety, reliability**. Use `"new grad" OR "entry level" chemical
  engineer <company>` and `"2026 graduate" OR "2027 graduate"`.
- **Industry, PhD**: R&D scientist and engineer, senior scientist, process
  development scientist, catalysis, polymers, electrochemistry, modeling and
  simulation, and data science roles that ask for a ChemE PhD.
- **Government, BS/MS**: USAJOBS series **0893 (Chemical Engineering)** and
  0819 (Environmental Engineering) entry grades (GS-5/7/9/11), USPTO patent
  examiner (chemical arts), EPA, FDA, DOE, Army Corps, NAVSEA, state
  environmental agencies, and national-lab technical staff postings.
- **Government, PhD**: national-lab postdocs and staff scientist roles (NREL,
  ORNL, ANL, PNNL, LBNL, LLNL, Sandia, LANL, NETL, Brookhaven, Idaho), NIST
  NRC postdocs, NRC/Ford/Intelligence Community postdoc programs, and
  government fellowships for PhDs.
- **Academic, BS/MS**: research engineer and lab manager positions in university
  ChemE departments and research centers, plus technician-scientist staff roles.
- **Academic, PhD**: tenure-track and teaching-track faculty searches in
  chemical engineering and closely aligned departments (search AIChE Career
  Discovery, Chronicle Vitae, HigherEdJobs, Academic Jobs Online, and
  department pages), and named or funded postdoctoral fellowships.

Prefer primary sources. Where a listing only exists on an aggregator, say so and
mark it a lead rather than a characterized posting.

## Format: this is a board of listing cards, not a wall of tables

Follow this structure exactly.

### Masthead

    `COMPILED {{TODAY}} · FULL-TIME ROLES · US POSTINGS`

    # Chemical Engineering Job Board

    <A 2-4 sentence lede describing the market right now: which sectors are
    hiring new grads, where PhD hiring is concentrated, which faculty or
    federal deadlines are close.>

Then a nearest-deadline callout as a blockquote:

    > **NEAREST HARD DEADLINE: <N> DAYS OUT**
    > **<Position>** closes **<date>**. <One or two sentences on what that
    > deadline actually means: USAJOBS application caps, faculty review dates,
    > whether everything else on the board is rolling.>

Then a four-cell stat row as a small table: positions listed · fixed deadlines
or review dates in the next 60 days · number open to non-US citizens with no
stated restriction · number verified by an actual live page load this session.
**Report that last number honestly, including when it is 0.**

Then a **jump grid**: a 3x3 markdown table with a header row
`| Degree | Industry | Government | Academic |` and one row each for BS, MS,
and PhD. Each cell is the card count linked to its section anchor, e.g.
`[7](#bs--industry)` (GitHub-style anchors: lowercase,
`·` dropped, so the two spaces become `--`), or `0` when the section is empty.

### Sections

One `## ` heading per degree and sector pair, in this exact form and order,
omitting a pair only when it has no cards:

    ## BS · Industry
    ## BS · Government
    ## BS · Academic
    ## MS · Industry
    ## MS · Government
    ## MS · Academic
    ## PhD · Industry
    ## PhD · Government
    ## PhD · Academic

**Place each card under the lowest degree the posting accepts**, and say in its
Degree row if higher degrees are also considered (`BS required; MS considered`).
A posting that requires an MS goes under MS even if a PhD is preferred.
National labs, federal agencies, and FFRDCs count as Government. Universities
count as Academic, including university-affiliated research institutes that
are not FFRDCs.

Under each `##`, write **2-3 sentences of judgment** about that slice of the
market: what is actually hiring, the common disqualifier (citizenship,
clearance, years of experience), and what is worth the reader's next hour. It
should be an actual claim, not a summary of the cards below.

### One card per position

    ### <Organization> — <job title as posted>
    `<location(s) · req/job/announcement number>`

    <One paragraph, 3-6 sentences, of real substance: what the work actually is
    (unit operations, scale-up, process control, permitting, catalysis,
    teaching load…), how the role or program is structured (rotations, shift
    work, field assignments, tenure clock, postdoc term), and any trap: a
    "new grad" title that actually requires 2+ years, a posting that has been
    up for months, a USAJOBS announcement capped at the first N applicants, a
    faculty search that names a narrow subfield.>

    [<readable link text: domain plus req number>](<url>)

    `<STATUS BADGE>` `<second badge if needed>`

    | | |
    |---|---|
    | **Deadline** | … |
    | **Citizen** | … |
    | **Degree** | … |
    | **Experience** | … |
    | **Pay** | … |

Badge vocabulary (pick the honest one):

`LIVE` · `ROLLING` · `HARD DEADLINE` · `REVIEW BEGINS` (academic "review of
applications begins <date>, open until filled") · `NEW GRAD` · `EXPERIENCE
REQUIRED` · `CLEARANCE REQUIRED` · `VERIFY DATE` (undated or months-old
posting) · `LIKELY CLOSED` · `LEADS — DETAILS UNCONFIRMED` · `NOT VERIFIED`
(page blocked or unreachable)

Fact-block rules:

- **Deadline**: an explicit closing date or review date when stated. Otherwise
  the literal truth: `Not stated; closes when filled`, `Rolling`, `Not stated`.
  For USAJOBS, give the closing date and any applicant cap.
- **Citizen**: often the deciding field. Quote the restriction: US citizenship
  required, sponsorship available or not, clearance level, export-control
  language. `Not stated` when the page is silent.
- **Degree**: the required degree and field, whether ChemE is named explicitly
  or among a list, and graduation-date windows.
- **Experience**: the stated years and type of experience. Flag mismatches
  between the title and the requirement.
- **Pay**: the posted salary range or GS grade and step range, plus relocation
  or sign-on terms when stated. `Not posted` when absent. Do not estimate pay
  from third-party salary sites.

Omit a row only when it would be pure noise. Group thin leads within a section
into a single card titled like *Additional postings* with the
`LEADS — DETAILS UNCONFIRMED` badge rather than making a card per rumor.

### Closing

- `## How to use this board`: 4-6 bullets of timing advice for this point in
  the year (fall faculty-search season, spring new-grad backfill, USAJOBS
  announcement cycles, postdoc start dates).
- `## Sources`: split into pages you actually fetched and read, versus hubs and
  aggregators used only for discovery.
- `## Caveats`: pages that blocked retrieval, slices that came up thin, what
  you did not cover, and a plain statement that postings close without notice
  and the linked page is the authority.

## Accuracy rules: these outrank completeness

- Never invent a position, URL, requisition number, deadline, or salary. Every
  card must trace to a page you saw this session.
- A stated fact and your estimate must never look alike. Estimates carry `est.`
  and name their basis.
- If a page 403s, 404s, or returns nothing, either drop the card or keep it with
  the `NOT VERIFIED` badge and say so in the fact block.
- Call out traps explicitly. A "new grad" role requiring three years, or an
  undated req that has been reposted for a year, is exactly what this board
  exists to catch.
- Aim for **35-60 cards** spread across the nine slices. Do not pad thin slices.
  BS · Academic and MS · Academic are often small, and that is fine; say so in
  the section judgment.
- Prefer a small number of ruthlessly verified cards over a long list of
  half-checked ones, and say in the caveats what you had to leave out.

Work through the searches, then write `{{OUTFILE}}` in one pass. Finish by
printing a two-line summary: the card count per degree level, and any section
that came up empty.
