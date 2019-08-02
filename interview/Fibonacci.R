# snippet 1
fib_1 <- function(x) {
  Fibonacci <- numeric(x)
  Fibonacci[1] <- Fibonacci[2] <- 1
  if (x >= 3) {
    for (i in 3:x) Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
  }
  return(Fibonacci)
}

# fib_1(1)

# snippet 2
fibonacci_dynamic <- function(n) {
  if(n <= 1) {
    return(n)
  } else {
    return(fibonacci_dynamic(n-1) + fibonacci_dynamic(n-2))
  }
}

fib_2 <- function(n) {
  if(n <= 0) {
    print("Plese enter a positive integer")
  } else {
    print("Fibonacci sequence:")
    for(i in 1:(n-1)) {
      print(fibonacci_dynamic(i))
    }
  }
}

# fib_2(10)

# snippet 3
fibVector <- c(1, 1) 

fibonacci_dynamic2 <- function(n){
  if (n<0) {
    print("Incorrect input")
  } else if (n <= length(fibVector)) {
    return(fibVector[n])
  } else {
    temp_fib <- fibonacci_dynamic2(n-1)+fibonacci_dynamic2(n-2) 
    fibVector <- c(fibVector, temp_fib)
    return(temp_fib)
  }
}

fib_3 <- function(n) {
  
}
fibonacci_dynamic2(1)