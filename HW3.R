# Required Library
library("tidyverse")
setwd("~/Desktop/DS/Hahow/source")
set.seed(500)

# Read Dataset
test.table <- read_csv("test_table.csv", locale= locale(encoding='UTF-8'))
user.table <- read_csv("user_table.csv", locale= locale(encoding='UTF-8'))

# 合併實驗表格與使用者資料
test.data <- left_join(test.table, user.table, by = "user_id")

# 變數類別的轉換
test.data$date <- as.Date(test.data$date, format = "%Y/%m/%d")

for(i in c(3,4,6,7,9)){
  test.data[, i] <- as.factor(test.data[[i]])
}

# 題目一
## 篩選出屬於日本市場的使用者，針對購買金額進行獨立樣本 t 檢定。
test.data_jp <- test.data %>%
  filter(country == 'JP')

## 請問：實驗組的購買金額有沒有顯著高於對照組的購買金額？
t.test(test.data_jp[test.data_jp$test == 1, ]$purchase_amount,
       test.data_jp[test.data_jp$test == 0, ]$purchase_amount,
       alternative = "greater")
## > t = -63, df = 9953, p-value = 1

## 反之，對照組金額有沒有顯著高於實驗組金額？
t.test(test.data_jp[test.data_jp$test == 1, ]$purchase_amount,
       test.data_jp[test.data_jp$test == 0, ]$purchase_amount,
       alternative = "less")
## > t = -63, df = 9953, p-value <2e-16

## 實驗組與對照組購買金額機率密度圖 (density plot)
ggplot(test.data_jp, aes(purchase_amount, fill = test, colour = test)) +
  geom_density(alpha = 0.3) +
  xlab("Purchase Amount") + ylab("Density") +
  ggtitle("Density Plot of JP Purchase Amount: Test versus Control") +
  theme_bw()

# 題目二
## 建立購物金額與是否為實驗組、設備、性別與服務的變異數分析(ANOVA)模型。
aov.model <- aov(
  purchase_amount ~ test + device + gender + service,
  test.data)
summary(aov.model)

## 請問，模型中有哪些因子是顯著的？
## test, device, service

## 請利用 ggplot2 繪製購買金額對應不同服務的盒狀圖 (boxplot)。
ggplot(test.data, aes(x = service, y = purchase_amount)) +
  geom_boxplot() +
  xlab("Service") + ylab("Purchase Amount") +
  ggtitle("Boxplot of Purchase Amount by Service") +
  theme_bw()

## 請進行 Tukey 事後檢定，
## 了解 test 對於購買金額的影響，並繪製信賴區間圖形。
TukeyHSD(aov.model, "test")
plot(TukeyHSD(aov.model, "test"))
## 了解 device 對於購買金額的影響，並繪製信賴區間圖形。
TukeyHSD(aov.model, "device")
plot(TukeyHSD(aov.model, "device"))