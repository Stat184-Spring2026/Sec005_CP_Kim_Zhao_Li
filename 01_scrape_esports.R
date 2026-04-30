# 01_scrape_esports.R
# ---------------------------------------------------------------
# Pulls the yearly "Top Games" summary pages from
# esportsearnings.com (2014 through 2024) and writes a single
# tidy CSV to data/games_by_year.csv.
#
# Primary author: [Name 1]
# Reviewed by:    [Name 2]
# Style:          Tidyverse (https://style.tidyverse.org/)
# ---------------------------------------------------------------

library(rvest)
library(polite)
library(dplyr)
library(tidyr)
library(purrr)
library(readr)
library(stringr)
library(janitor)
library(fs)

years <- 2014:2024
cache_dir <- "data-raw/cache"
dir_create(cache_dir)

# polite handles robots.txt, user-agent, and throttling in one place.
session <- bow(
  url        = "https://www.esportsearnings.com/",
  user_agent = "STAT184 Spring 2026 course project (contact: [psuid]@psu.edu)",
  delay      = 5
)

clean_money <- function(x) {
  # turn "$12,345,678" into 12345678
  x |>
    str_remove_all("[\\$,]") |>
    as.numeric()
}

scrape_year <- function(yr) {
  cache_file <- path(cache_dir, sprintf("games_%d.html", yr))
  rel_path   <- sprintf("history/%d/games", yr)

  if (!file_exists(cache_file)) {
    page <- nod(session, rel_path) |> scrape()
    write_html(page, cache_file)
    message("fetched ", yr)
  } else {
    page <- read_html(cache_file)
  }

  tbl <- page |>
    html_element("table.detail_list_table") |>
    html_table(convert = FALSE)

  if (is.null(tbl)) {
    warning("no games table found for ", yr)
    return(NULL)
  }

  tbl |>
    clean_names() |>
    rename_with(~ str_replace_all(.x, "^x_+", "")) |>
    mutate(
      year             = yr,
      total_earnings_usd = clean_money(total_prize_pool),
      tournaments      = as.integer(tournaments),
      active_players   = as.integer(active_players)
    ) |>
    select(year, game, total_earnings_usd, tournaments, active_players) |>
    filter(!is.na(game), game != "")
}

games_by_year <- map(years, scrape_year) |>
  list_rbind()

# sanity checks before we hand the file off to the report
stopifnot(
  nrow(games_by_year) > 0,
  all(c("year", "game", "total_earnings_usd") %in% names(games_by_year)),
  all(games_by_year$year %in% years)
)

dir_create("data")
write_csv(games_by_year, "data/games_by_year.csv")

message("wrote data/games_by_year.csv  (", nrow(games_by_year), " rows)")
