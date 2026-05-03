# Sec#2J1S_CP_Kim_Zhao_Li

# Esports Prize Money, Tournaments, and Players (1998-2025)

Stat 184 group project (Spring 2026). We track how the esports industry has scaled from a handful of arcade tournaments in the late 1990s to one of the largest entertainment categories in the world, and what changed once the growth stopped.

## Team

| Name      | Email              | Primary role                     |
|-----------|--------------------|----------------------------------|
| Junbo Zhao  | jzz5658@psu.edu    | Scraping, tidying, plots         |
| Seokyoung Kim  | smk7032@psu.edu    | Supplementary data, tables  
| Jixian Li  |  jpl6859@psu.edu  | data analyze and organize
|-----------|--------------------|----------------------------------|


## Authors

- Seokyoung Kim — Section 3.1: prize money vs. tournament count
- Junbo Zhao — Section 3.2: mean vs. median (skew over time)
- JiXian Li — Section 3.3: active players vs. total prize money

The Introduction, Data Description, Summary, and Code Appendix were written together.

## What's in this folder

| File | What it is |
|---|---|
| `project.qmd` | Main report. Renders to PDF. |
| `Esports_Stats.csv` | The dataset (28 rows, one per year from 1998 to 2025). |
| `README.md` | This file. |

## How to render

You will need a recent version of R (4.2 or later) and Quarto (1.3 or later), plus the following R packages: `tidyverse`, `scales`, `knitr`. From this folder, run:

```bash
quarto render project.qmd
```

The output is `project.pdf`. The Code Appendix at the end of the PDF is auto-generated from the chunks in the body, so editing a chart in the body updates the appendix on the next render.

## Data source

`Esports_Stats.csv` was compiled from public year-level totals on [esportsearnings.com](https://www.esportsearnings.com/), a community-maintained tracker of esports tournament results. The columns are:

- `year` — calendar year
- `Total Prize Money` — sum across all tracked tournaments that year, USD
- `Total Tournaments` — number of tracked tournaments that year
- `Total Active Players` — players with at least one tracked prize that year
- `Mean Tournament Prize Pool`, `Median Tournament Prize Pool` — center of the per-tournament distribution
- `Mean Earnings/Player`, `Median Earnings/Player` — center of the per-player distribution

All dollar amounts are nominal USD (no inflation adjustment). The 2025 row may be incomplete because esportsearnings.com keeps adding results to recent years for some time after the year ends.

## Notes

The dataset does not split by game title, so headline events like Dota 2's The International get averaged in with smaller Counter-Strike LANs and grassroots tournaments. We discuss that and other limitations at the end of the report.

