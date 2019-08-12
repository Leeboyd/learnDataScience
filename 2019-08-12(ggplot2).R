# Load the ggplot2 package
library(ggplot2)

# Create line plot
ggplot(by_year, aes(year, percent_yes))+ geom_line()

ggplot(by_year, aes(year, percent_yes)) +
  geom_point() + geom_smooth()

by_year_country <- votes_processed %>%
  group_by(year, country) %>%
  summarize(total = n(), percent_yes = mean(vote == 1))

# Create a filtered version: UK_by_year
UK_by_year <- by_year_country %>%
  filter(country == 'United Kingdom')

# Line plot of percent_yes over time for UK only
ggplot(UK_by_year, aes(year, percent_yes)) + geom_line()

# Vector of four countries to examine
countries <- c("United States", "United Kingdom",
               "France", "India")

# Filter by_year_country: filtered_4_countries
filtered_4_countries <- by_year_country %>%
  filter(country %in% countries)

# Line plot of % yes in four countries
ggplot(filtered_4_countries, aes(x=year, y=percent_yes, color=country)) + geom_line()

# Vector of six countries to examine
countries <- c("United States", "United Kingdom",
               "France", "Japan", "Brazil", "India")

# Filtered by_year_country: filtered_6_countries
filtered_6_countries <- by_year_country %>%
  filter(country %in% countries)

# Line plot of % yes over time faceted by country
ggplot(filtered_6_countries, aes(x=year, y=percent_yes)) +
  geom_line() +
  facet_wrap(~ country, scales = "free_y")