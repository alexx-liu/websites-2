library(tidyverse)

top_songs <- billboard |>
  mutate(chart_weeks = rowSums(!is.na(across(starts_with("wk"))))) |>
  slice_max(chart_weeks, n = 5, with_ties = FALSE) |>
  mutate(song = paste(artist, track, sep = " - ")) |>
  select(song, starts_with("wk")) |>
  pivot_longer(
    starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    names_prefix = "wk"
  ) |>
  mutate(week = as.integer(week)) |>
  drop_na(rank)

write_rds(top_songs, file = "clean_data.rds")
