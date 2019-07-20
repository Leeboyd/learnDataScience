# 求歐氏距離公式
euclidean_distance <- function(v1, v2){
  return(sqrt(sum( (v1 - v2) ** 2)))
}

euclidean_distance_matrix <- function(df, dim) {
  distance <- c()
  for (i in 1:dim) {
    for (j in 1:dim) {
      distance <- c(distance, euclidean_distance(df[j,1:4], df[i,1:4]))
    }
  }
  return(matrix(distance, nrow = dim, ncol = dim))
}

euclidean_distance_matrix(iris, 150)


