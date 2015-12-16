# 類神經網路
library("neuralnet")

# training stage
trainingdata <- read.csv(file.choose())
net.model <- neuralnet(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,trainingdata, hidden=10, threshold=0.01)
print(net.model)
plot(net.model)

# testing stage
testingfile <- read.csv(file.choose())
testingdata <- subset(testingfile, select = -Species)
testingtarget <- testingfile$Species
results <- compute(net.model, testingdata)
print(round(results$net.result))

# accuracy
table(testingtarget, round(results$net.result))
accuracy <- sum(testingtarget == round(results$net.result))/length(testingtarget)
sprintf("%.2f%%", accuracy * 100)
