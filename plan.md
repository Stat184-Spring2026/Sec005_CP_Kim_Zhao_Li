# Checkpoint #2 — Initial Plan

**Course:** Stat 184, Spring 2026  
**Section:** Sec #  
**Team:** [Name 1], [Name 2]  
**Date:** April 21, 2026

## What we want to look at

We want to see how the competitive esports scene has shifted over roughly the last ten years. Which games have actually dominated the prize money, how that splits across genres, and where the money ends up geographically. Both of us play games casually (one plays Valorant, the other drifts between League and single-player stuff), so we're familiar with the context, but we are going to treat ourselves as outsiders and let the numbers do the talking.

## Primary data source

The yearly "Top Games" history pages on `esportsearnings.com`, 2014 through 2024. Each year gives a ranked list of games by total tournament earnings, plus number of active players and tournaments per game. Each game also has its own page that we'll hit for genre and release year. The site is on the approved list in the Project Guidelines.

We will scrape using `{rvest}` on top of `{polite}` so the session respects `robots.txt` and throttles requests. Raw HTML gets cached under `data-raw/cache/` for reproducibility and to avoid hammering the server on re-runs.

## Supplementary data

SteamCharts monthly peak concurrent players, for the subset of PC games that show up in the earnings table. This lets us ask whether a game's prize pool actually tracks its playerbase — something the esportsearnings data alone can't answer. If the Steam scrape gets messy we have a backup: Twitch viewership hours from SullyGnome. Country populations and GDP come from the World Bank API if we end up normalizing earnings per capita.

## Tentative research questions

1. How has the genre mix of the top-earning esports titles changed from 2014 to 2024? Is MOBA still pulling the biggest share, or have Battle Royale and tactical FPS eaten into that?
2. Within a single year, how concentrated is prize money among the top few games, and has that concentration tightened or loosened over time?

We'll narrow these down after the first real pass through the data. One of them might turn out to be boring.

## Initial division of labor

- **[Name 1]:** scraping esportsearnings, initial tidying, genre coding by hand for the top ~30 games, time-series plots.
- **[Name 2]:** SteamCharts / Twitch pull, country-level aggregation, professional tables via `{gt}`.
- **Both:** EDA narrative, cross-review via PRs, final report editing.

## Known risks and how we're planning around them

The page schema might have changed across years (class names drift), so we've budgeted the first two days to sanity-check each year's scrape. Some historical tournaments have missing country or player info — we'll document what we drop and why in the report. Finally, our Steam match will only cover PC titles, so any claims about console-heavy games (Smash, some fighting games) will be clearly scoped.

## Citation style

APA 7th (CSL file already in the repo).
