# 貝氏分類

library("e1071")

# training stage
trainingdata <- read.csv(file.choose())
nb.model <- naiveBayes(factor(Species)~Sepal.Length + Sepal.Width + Petal.Length +  Petal.Width, data=trainingdata)
print(nb.model)

# testing stage
testingfile <- read.csv(file.choose())
testingdata <- subset(testingfile, select = -Species)
testingtarget <- testingfile$Species
results <- predict(nb.model, newdata = testingdata)
print(results)

# accuracy
table(results, testingtarget)
accuracy <- sum(testingtarget == results) /length(testingtarget)
sprintf("%.2f%%", accuracy * 100)