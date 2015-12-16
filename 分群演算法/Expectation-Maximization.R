# 期望最大值演算法

library(mclust)

# input data
inputfile <- read.csv(file.choose())
inputdata <- subset(inputfile, select = -Species)

# computation
em.model <- Mclust(inputdata, 3)
print(em.model)

# evaluation
table(inputfile$Species, em.model$classification)
plot(em.model, what=c('classification'), mens=c(3,4))