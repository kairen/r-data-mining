# k 平均演算法

# input data
inputdata <- read.csv(file.choose())


# computation
km.model <- kmeans(inputdata, 3)
print(km.model)

# evaluation
table(inputdata$Species, km.model$cluster)
plot(inputdata[c("Sepal.Length", "Sepal.Width")], col=km.model$cluster)
points(km.model$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)