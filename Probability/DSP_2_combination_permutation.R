# Code: Introducing paste and expand.grid
number <- "Three"
suit <- "Hearts"
paste(number, suit)
## joining vectors element-wise with paste
paste(letters[1:5], as.character(1:5))

## generating combinations of 2 vectors with expand.grid
expand.grid(pants = c("blue", "black"), shirt = c("white", "grey", "plaid"))


# Code: Generating a deck of cards
suits <- c("D", "C", "H", "S")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")

deck <- expand.grid(number = numbers, suit = suits)
deck <- paste(deck$number, deck$suit)

## probability of drawing a king
kings <- paste("King", suits)
mean(deck %in% kings)

# Code: Permutations and combinations
### install.packages("gtools")
library(gtools)
permutations(5,2) # ways to choose 2 numbers in order from 1:5 5!/(5-2)!

## choose 5 7-digit phone number
all_phone_numbers <- permutations(10, 7, v = 0:9)
n <- nrow(all_phone_numbers)
index <- sample(n, 5)
all_phone_numbers[index,]

# Code: probability of drawing a second king given that one king is drawn
hands <- permutations(52, 2, v = deck)
first_card <- hands[,1]
second_card <- hands[,2]
sum(first_card %in% kings)

## P(second king | first king)
sum(first_card %in% kings & second_card %in% kings) / sum(first_card %in% kings)

# Code: Probability of a natural 21 in blackjack
aces <- paste("Ace", suits)

facecard <- c("Ten", "Jack", "Queen", "King")
facecard <- expand.grid(number = facecard, suit = suits)
facecard <- paste(facecard$number, facecard$suit)

hands <- combinations(52, 2, v = deck)

## probability of a natural 21 given that 
## the ace is listed first in `combinations`
mean(hands[,1] %in% aces & hands[,2] %in% facecard)
