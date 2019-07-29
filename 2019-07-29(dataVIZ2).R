# setwd("~/Desktop/DS/learnDataScience")

library(tidyverse)
library(knitr)
library(readr)
SalesTable <- read_csv("~/Desktop/DS/Hahow/SalesTable.csv")
ClientTable <- read_csv("~/Desktop/DS/Hahow/ClientTable.csv")
ProductTable <- read_csv("~/Desktop/DS/Hahow/ProductTable.csv")

SalesTableNew <- SalesTable %>%
  inner_join(ClientTable, by = 'Client_ID') %>%
  inner_join(ProductTable, by = 'Product_ID')

# table 6
Product <- SalesTableNew %>%
  group_by(Client_Name, Product_Name) %>%
  summarise(Sales = sum(Sales))

# table 7
ClientProductTable <- Product %>%
  spread( key = Product_Name, 
          value = Sales) %>%
  data.frame()



Block <- function(ClientProductTable){
  
  ClientProductTable$x_Percentage <- c()
  
  for (i in 1:nrow(ClientProductTable)) {
    ClientProductTable$x_percentage[i] <- rowSums(ClientProductTable[i,-1], na.rm = T) / sum(rowSums(ClientProductTable[,-1], na.rm = T))
  }
  ### 每筆上界：累加, 下界：上界 - 比例
  ClientProductTable$x_max <- cumsum(ClientProductTable$x_percentage)
  ClientProductTable$x_min <- ClientProductTable$x_max - ClientProductTable$x_percentage
  ClientProductTable$x_percentage <- NULL

  # table 8
  Percentage <- ClientProductTable %>%
    gather( key =  Product_Name,
            value = Sales,
            -c(Client_Name, x_min,x_max))#A,B,C,D,F,G,H,J,K,L,N,O,P,Q,R)
  
  Percentage[,5] <- ifelse(Percentage[,5] %in% NA, 0, Percentage[,5])
  colnames(Percentage)[5] <- 'Sales'
  
  ### Y軸的比例
  Percentage <- Percentage %>%
    group_by( Client_Name) %>%
    mutate( y_max = round(cumsum(Sales) / sum(Sales) * 100)) %>%
    mutate( y_min = round((y_max - Sales/ sum(Sales) * 100)))
  
  
  ### 文字的位置
  Percentage <- Percentage %>%
    mutate( x_text = x_min + (x_max - x_min)/2, 
            y_text = y_min + (y_max - y_min)/2)
  
  Percentage <- Percentage %>%
    group_by( Client_Name) %>%
    mutate( Proportion = round( Sales / sum(Sales),2) * 100)
  
  ### 作圖
  ggplot(Percentage, aes(ymin = y_min, ymax = y_max,
                         xmin = x_min, xmax = x_max, fill = Product_Name)) +
    geom_rect(colour = I("grey"), alpha = 0.9) + 
    
    geom_text( aes(x = x_text, y = y_text,
                   label = ifelse( Client_Name %in% levels(factor(Client_Name))[1] & Proportion != 0, 
                                   paste(Product_Name," - ", Proportion, "%", sep = ""),
                                   ifelse(Proportion != 0, paste( Proportion,"%", sep = ""), paste(NULL)))), size = 2.5) + 
    geom_text(aes(x = x_text, y = 103,
                  label = paste(Client_Name)), size = 3) + 
    labs( title = 'Sales Distribution by Client & Product',
          x = 'Client',
          y = 'Product') + theme_bw()
}
Block(ClientProductTable)