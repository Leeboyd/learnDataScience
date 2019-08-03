library(gtools)
library(tidyverse)
options(digits = 3)    # report 3 significant digits

set.seed(1, sample.kind = "Rounding")

runners <- c("Jamaica", "Jamaica", "Jamaica",  "USA", "Ecuador", "Netherlands", "France", "South Africa")
medals <- c("G", "S", "B")

# How many different ways can the 3 medals be distributed across 8 runners?
permutations(8,3, runners)

# How many different ways can the three medals be distributed among the 3 runners from Jamaica?
results <- expand.grid(runner = c("Usain", "Yohan", "Warren"), medal = medals)

# What is the probability that all 3 medals are won by Jamaica?

# Calculate the probability that all the runners are from Jamaica.
Jamaica_wins <- replicate(10000, {
  simulated_games <- sample(runners, 3, replace = FALSE)
  sum(simulated_games %in% "Jamaica") == 3
})

mean(Jamaica_wins)
