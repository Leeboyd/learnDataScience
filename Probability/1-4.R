# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# The variables 'green', 'black', and 'red' contain the number of pockets for each color
green <- 2
black <- 18
red <- 18

# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- green / (green+black+red)

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1 - p_green

# Create a model to predict the random variable `X`, your winnings from betting on green. Sample one time.
X <- sample(c(17, -1), 1, replace = TRUE, 
            prob = c(p_green, p_not_green)) 

# Print the value of `X` to the console
print(X)

# Compute the standard error of the random variable
print(abs(17-(-1)) * sqrt(p_green * (1-p_green)))

# Define the number of bets using the variable 'n'
n <- 1000

# Create a vector called 'X' that contains the outcomes of 1000 samples
X <- sample(c(17, -1), 1000, replace = TRUE, 
            prob = c(p_green, p_not_green)) 

# Assign the sum of all 1000 outcomes to the variable 'S'
S <- sum(X)

# Print the value of 'S' to the console
print(S)

# Calculate the expected outcome of 1,000 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
print(1000*(17*p_green-1*p_not_green))

# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# Define the number of bets using the variable 'n'
n <- 100

# Calculate 'avg', the expected outcome of 100 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
avg <- n * (17*p_green + -1*p_not_green)

# Compute 'se', the standard error of the sum of 100 outcomes
se <- sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Using the expected value 'avg' and standard error 'se', compute the probability that you win money betting on green 100 times.
print(1 - pnorm(0, avg, se))

# Create an object called `S` that replicates the sample code for `B` iterations and sums the outcomes.
S <- replicate(B, {
  simulated_games <- sample(c(17,-1), n, replace = TRUE, prob = c(p_green, p_not_green))
  sum(simulated_games)
})

# Compute the average value for 'S'
mean(S)

# Calculate the standard deviation of 'S'
sd(S)

# Create a vector called `X` that contains the outcomes of `n` bets
X <- sample(c(17, -1), n, replace = TRUE, prob = c(p_green, p_not_green))

# Define a variable `Y` that contains the mean outcome per bet. Print this mean to the console.
Y <- mean(X)

# Compute the standard error of 'Y', the mean outcome per bet from 10,000 bets.
print(abs(17-(-1)) * sqrt(p_green * (1-p_green))/sqrt(n))