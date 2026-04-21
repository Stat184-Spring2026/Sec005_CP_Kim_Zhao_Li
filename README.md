# Sec#_CP_[Name1]_[Name2]

Stat 184 course project, Spring 2026. We're looking at how the esports
industry has shifted over the last ten years — prize pools, genre mix,
and geographic distribution — using data scraped from
`esportsearnings.com` alongside playerbase and viewership numbers from
Steam and Twitch.

## Team

| Name      | Email              | Primary role                     |
|-----------|--------------------|----------------------------------|
| Junbo Zhao  | jzz5658@psu.edu    | Scraping, tidying, plots         |
| [Name 2]  | [psuid]@psu.edu    | Supplementary data, tables       |

## Repo layout

```
.
├── project.qmd         # the report (renders to PDF)
├── plan.md             # Checkpoint #2 plan
├── references.bib      # BibTeX entries for the report
├── apa7.csl            # citation style (dropped in from the template)
├── data-raw/           # scraping scripts + cached HTML
│   └── 01_scrape_esports.R
├── data/               # tidied csv / rds files (git-tracked)
├── R/                  # helper functions sourced from the qmd
│   └── scrape_helpers.R
├── figures/            # exported plots (only if needed outside qmd)
├── .gitignore
└── .lintr              # BOAST / tidyverse lint config
```

## How to reproduce

1. Clone the repo.
2. Open the project in RStudio (there's an `.Rproj` once someone on the
   team generates one — see TODO below).
3. Run the scraper once: `source("data-raw/01_scrape_esports.R")`. It
   caches pages under `data-raw/cache/`, so re-runs are fast.
4. Render the report: `quarto render project.qmd`.

Packages we rely on: `rvest`, `polite`, `dplyr`, `tidyr`, `ggplot2`,
`gt`, `janitor`, `fs`, `purrr`, `readr`, `stringr`, `lubridate`.

## Coding style

Tidyverse style guide. We lint with `{lintr}` using the `.lintr` file
checked into the repo before every PR.

## Git workflow

- `main` is the protected branch. Do not push to `main` directly.
- Each of us works on a personal branch: `dev-name1`, `dev-name2`.
- Open a Pull Request when your branch is ready. The other person
  reviews and merges. At least one approval before merge.
- Commit messages follow the short imperative style, e.g.
  `Add 2019 scrape and handle missing country column`.

## TODO before Checkpoint #3

- [ ] Add `.Rproj` and lockfile.
- [ ] First end-to-end scrape + tidy.
- [ ] First EDA plot committed.
- [ ] README links added to plan and references.



## Authors

Give information about who are the authors of the project and how people can get in touch if they have questions.
