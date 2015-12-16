# 決策樹
library("party")

# training stage
trainingdata <- read.csv(file.choose())
tree.model <- ctree(factor(Species)~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=trainingdata)
print(tree.model)
plot(tree.model)

# testing stage
testingfile <- read.csv(file.choose())
testingdata <- subset(testingfile, select = -Species)
testingtarget <- testingfile$Species

results <- predict(tree.model, newdata = testingdata)
print(results)

# accuracy
table(results, testingtarget)
accuracy <- sum(testingtarget == results)/ length(testingtarget)
sprintf("%.2f%%", accuracy * 100)