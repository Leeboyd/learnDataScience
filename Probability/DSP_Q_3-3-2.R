# What is the expected value of the payout for one bet?
p <- 5/38
a <- 6
b <- -1
mu <- a*p + b*(1-p)

# What is the standard error of the payout for one bet?
se <- abs(a-b) * sqrt(p*(1-p))

# What is the expected value of the average payout over 500 bets?
n <- 500
expect_avg <- n * (a*p + b*(1-p))/n

# What is the expected value of the sum of 500 bets?
expect_sum <- 500 * mu

# What is the standard error of the sum of 500 bets?
se_sum <- sqrt(n) * abs(a-b) *sqrt(p*(1-p))

# What is the standard error of the average payout over 500 bets?                     
se_avg <- (abs(a-b) * sqrt(p*(1-p))) / sqrt(n)

# Use pnorm with the expected value of the sum and standard error of the sum to calculate the probability of losing money over 500 bets,  Pr(𝑋≤0) .
p_losing <- pnorm(0, expect_sum, se_sum)