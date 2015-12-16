# 支援向量機

library("e1071")

# training stage
trainingdata <- read.csv(file.choose())
svm.model <- svm(factor(Species)~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=trainingdata)
print(svm.model)
plot(svm.model,trainingdata,Petal.Length~Petal.Width)

# testing stage
testingfile <- read.csv(file.choose())
testingdata <- subset(testingfile, select = -Species)
testingtarget <- testingfile$Species
results <- predict(svm.model, newdata = testingdata)
print(results)

# accuracy
table(results, testingtarget)
accuracy <- sum(testingtarget == results) /length(testingtarget)
sprintf("%.2f%%", accuracy * 100)
