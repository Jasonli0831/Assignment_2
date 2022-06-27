library(tidyverse)
library(janitor)

citibike_202205 <- read_csv("JC-202205-citibike-tripdata.csv") %>%
  clean_names() %>%
  select(started_at, ended_at, end_station_name, end_station_id) %>%
  filter(!is.na(end_station_name), !is.na(end_station_id)) %>%
  mutate(time = difftime(ended_at, started_at, unit = 'mins',))

summarize(citibike_202205, time > 10)

write_csv(citibike_202205, "citibike_202205.csv")
