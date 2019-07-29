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

# head(SalesTableNew)
# 將所有Agency、Product_ID和Client_ID都轉為factor類別
SalesTableNew$Agency <- as.factor(SalesTableNew$Agency)
SalesTableNew$Product_ID <- as.factor(SalesTableNew$Product_ID)
SalesTableNew$Client_ID <- as.factor(SalesTableNew$Client_ID)

# head(SalesTableNew)
# table 1 銷售量、價格
SalesTablePrice <- SalesTableNew %>%
  mutate( Unit_Price = Sales / Sales_Amount)

# head(SalesTablePrice)
# alpha 透明度
# plot 1
ggplot(data = SalesTablePrice,
       aes( x = Unit_Price,
            y = Sales_Amount)) +
  geom_point(color = 'salmon',
             alpha = 0.5) +
  theme_bw()

# plots 2 不同客戶之間 sales
ggplot(SalesTableNew) + 
  geom_boxplot(aes(x = factor(Client_Name),
                   y = Sales,
                   colour = Client_Name)) +
  labs( x = 'Client',
        title = 'Sales Distribution by Client') + 
  theme_bw()

# table 2 Client x Sales in total
SalesTableSum <- SalesTableNew %>%
  group_by(Client_Name) %>%
  summarise(Sales_sum = sum(Sales)) %>%
  arrange(desc(Sales_sum))

# head(SalesTableSum)
# plot 3 Client x Sales_sum
ggplot(data = SalesTableSum,
       aes(x = Client_Name,
           y = Sales_sum,
           fill = Client_Name)) +
  geom_bar( stat = 'identity') +
  scale_x_discrete(limits = SalesTableSum$Client_Name) +
  labs(title = 'Total Sales by Client',
       x = 'Client',
       y = 'Sales in total',
       fill = 'Client_Name') + theme_bw()

# plot 4 client x unit price
ggplot( data = SalesTablePrice) + 
  geom_boxplot(aes( x = as.factor(Client_Name),
                    y = Unit_Price,
                    colour = Client_Name)) +
  
  labs(title = 'Unit_Price by Client',
       x = 'Client',
       y = 'Unit_Price in total',
       fill = 'Client_Name') + theme_bw()

# plot 5 產品 x 銷售
ggplot( data = SalesTableNew) +
  geom_boxplot(aes( x = Product_Name,
                    y = Sales,
                    color = Product_Name)) +
  labs( x = 'Product',
        title = 'Sales Distribution by Product') + theme_bw()

# table 3
SalesTableAmount <- SalesTableNew %>%
  group_by( Product_Name ) %>%
  summarise( Amount_Sum = sum(Sales_Amount)) %>%
  arrange(desc(Amount_Sum))

# plot 6 產品 總銷售量
ggplot( data = SalesTableAmount) + 
  geom_bar( aes( x = Product_Name,
                 y = Amount_Sum,
                 fill = Product_Name),
            stat = 'identity') +
  scale_x_discrete(limits = SalesTableAmount$Product_Name) +

  labs(title = 'Total Sales_Amount by Product',
       x = 'Product',
       y = 'Sales_Amount in total',
       fill = 'Product_Name') + theme_bw()

# table 4
SalesTableClient <- SalesTableNew %>%
  group_by(Client_Name, Product_Name) %>%
  summarise(Sales = sum(Sales))

# plot 7 facet_wrap( ~ Client_Name)
ggplot(data = SalesTableClient) +
  geom_bar(aes(x = Product_Name,
               y = Sales),
           stat = 'identity') +
  facet_wrap( ~ Client_Name)

# table 5
SalesTableAgency <- SalesTableNew %>%
  group_by(Agency, Product_Name) %>%
  summarise( Sales = sum(Sales))

# plot 8
ggplot( data = SalesTableAgency) +
  geom_bar( aes( x = Product_Name,
                 y = Sales),
            stat = 'identity') +
  facet_wrap( ~ Agency)