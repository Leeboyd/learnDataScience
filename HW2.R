install.packages("tidyverse")

library("tidyverse")
library("magrittr")
library("readr")

tw_stock.data <- read_csv("Desktop/DS/Hahow/TWSE_Stock Data_2012-2017.csv")


# Get column names
tw_stock.data.columns <- colnames(tw_stock.data)

# Gather values and form it as a new column
new_tw_stock.data <- tw_stock.data %>%
  gather(key = "date",
         value = "price",
         tw_stock.data.columns[3:ncol(tw_stock.data)]) %>%
  spread(key = "type",
         value = "price",
         ) %>%
  separate(
    col = "date", 
    into = c("year", "month", "day"),
    sep = "/",
    convert = TRUE
  )

new_tw_stock.data