library(tibble)

mini_iris <- as_tibble(iris)
# mini_iris

mytibble <- tibble(x = 1:5, y = 1 / x, z = x ^ 2)

# tribble(
#   ~x, ~y, ~z,
#   "a", 2, 3.6,
#   "b", 3, 2
# )

# add row
add_row(mytibble, x = 6, y = 1 / x, z = x ^ 2)

add_row(mytibble, x = 1.5, y = 1 / x, z = x ^ 2, .before = 2)

df_uni <- data.frame(
  abc = 1:10, 
  def = runif(10, min = 10, max = 20), 
  xyz = sample(letters, 10)
)
# df 缺點：部分比對，應該全對才撈出資料
df_uni$a

tb_uni <- as_tibble(df_uni)

# NULL
tb_uni$a
# Warning message:
# Unknown or uninitialised column: 'a'. 

# 取值
tb_uni[1:4,]
tb_uni[,1:2]
tb_uni[[1]]

# 轉換為 data frame
class(as.data.frame(tb_uni))

