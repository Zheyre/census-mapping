library(tidyverse)
library(tidycensus)

sarasota <- get_acs(
  geography = "tract",
  state = "FL",
  county = "Sarasota",
  variables = c(White = "B03002_003", Black = "B03002_004",
                Asian = "B03002_006", Hispanic = "B03002_012"),
  summary_var = "B03002_001",
  year = 2023,
  geometry = TRUE,
  progress_bar = FALSE
) |>
  mutate(percent = 100 * estimate / summary_est)

write_rds(sarasota, "sarasota.rds")
