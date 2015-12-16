# 模糊c平均演算法

library(e1071)

# input data
inputfile <- read.csv(file.choose())
inputdata <- subset(inputfile, select = -Species)

# computation
cm.model <- cmeans(inputdata, 3, 100, m=2, method="cmeans")
print(cm.model)

# evaluation
table(inputfile$Species, cm.model$cluster)
plot(inputdata[,1], inputdata[,2], col=cm.model$cluster)