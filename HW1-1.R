# - 輸入：名為 iris 的資料框架，計算 iris 的統計量 0    
# - 輸出：名為 output 的資料框架，output  columns 的值依序為 iris
#   的平均數（`mean`）、變異數（`var`）、最大值（`max`）、最小值（`min`），
#   每個 row 是 iris 的一個 column 
# 
# HW1-1: 自訂一個函數，計算 iris 資料集合前四個 columns 的各項統計量。

## Get Data
data(iris)

# 觀察資料
head(iris, n = 10)

# 描述性統計
descriptive_dataframe <- function(df){
  data_mean <- sapply(df, mean)
  data_var <- sapply(df, var)
  data_max <- sapply(df, max)
  data_min <- sapply(df, min)
  
  output <- data.frame(data_mean, data_var, data_max, data_min)
  return(output)
}

descriptive_dataframe(iris[,1:4])

