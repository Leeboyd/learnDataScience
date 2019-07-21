install.packages("tidyverse")

library("tidyverse")
library("magrittr")


pew <- read_delim(
  "http://stat405.had.co.nz/data/pew.txt",
  delim = "\t"
)

# 把值當成變數 - 使用 gather

# gather(data,
#        key = "key",
#        value = "value",
#        ...,
#        na.rm = FALSE,
#        convert = FALSE,
#        factor_key = FALSE)

# Get column names
pew.columns <- colnames(pew)

# Gather values and form it as a new column
pew.new <- pew %>%
  gather(key = "incomes",
         value = "cases",
         pew.columns[2:ncol(pew)])

print(pew.new)

# spread(data,
#        key,
#        value,
#        fill = NA,
#        convert = FALSE,
#        drop = TRUE,
#        sep = NULL)

# 把變數當成值 - 使用 spread
table2 %>%
  spread(key = type,
         value = count,
         sep = '_')

library(readr)
tb <- read_csv("Desktop/DS/Hahow/tb.csv")

tb.colnames = colnames(tb)

tb_tidy <- tb %>%
  gather(
    tb.colnames[4:ncol(tb)],
    key = "group",
    value = "cases"
  ) %>%
  separate(
    col = "group",
    into = c("gender", "age"),
    sep = "_",
    convert = TRUE
  )
tb_tidy
#     
# long_iris <- iris%>%
#   gather(part,value,Sepal.Length,Sepal.Width,Petal.Length ,Petal.Width)%>%
#   separate(part, c('part', 'measure'), sep = '\\.')

tb_new <- read_csv("Desktop/DS/Hahow/tb_new.csv")

# unite(data,
#       col,
#       ...,
#       sep = "_",
#       remove = TRUE)

tb_new %>%
  unite(
    col = "age",
    c("age_lb", "age_ub"),
    sep = "-"
  )