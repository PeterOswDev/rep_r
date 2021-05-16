wine <- read.csv("C:/Users/oswpe/OneDrive/Desktop/R_exercises/Winequality-red.csv", sep = ",")
View(wine)
head(wine)
barplot(table(wine$quality))
View(wine$quality)
wine$taste <- ifelse(wine$quality < 6,'bad','good')
wine$taste[wine$quality == 6] <- 'normal'
wine$taste <- as.factor(wine$taste)
table(wine$taste)

set.seed(123)
samp <- sample(nrow(wine), 0.6 * nrow(wine))
train <- wine[samp, ]
test <- wine [-samp, ]
install.packages("randomForest")
library(randomForest)
model <- randomForest(taste ~. - quality, data = train)
install.packages("randomForest")
model
pred <- predict(model, newdata = test)
table(pred, test$taste)
(482 +252 + 667) / nrow(test)
a<-20
print(a)