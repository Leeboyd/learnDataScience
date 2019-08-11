set.seed(21, sample.kind = "Rounding")
options(digits = 3)
n <- 44
# 1 
p_correct <- 1/5
print(p_correct)

# 2 
expect <- 1 * p_correct + -0.25  * (1-p_correct)
print(expect)

# 3
# 0

# 4
se <- abs(1 - -0.25) * sqrt(n) * sqrt(p_correct * (1-p_correct))
print(se)

# 5
p_higher8 <- 1 - pnorm(8, expect, se)

# 6
S <- replicate(10000, {
  simulated_games <- sample(c(1,-0.25), 44, replace = TRUE, prob = c(p_correct, 1-p_correct))
  sum(simulated_games) >= 8
})
mean(S)

# 2-1 
p_correct <- 1/4
p_not_correct <- 1 - p_correct
new_exp <- n * 1 * p_correct

# 2-2
se <- sqrt(n * p_correct * p_not_correct)
p_higher30 <- 1 - pnorm(30, new_exp, se)


p <- seq(0.25, 0.95, 0.05)
# 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95
findexp <- function(p_correct) {
  return(44 * 1 * p_correct)
}

findsd <- function(p_correct) {
  return(sqrt(44 * p_correct * (1-p_not_correct)))
}

findpdf <- function(p_correct) {
  return(1 - pnorm(35, findexp(p_correct), findsd(p_correct)))
}
# p_higher35 <- findpdf()
print(p_higher35)