# 自組織映射圖

library(som)

# input data
inputfile <- read.csv(file.choose())
inputdata <- subset(inputfile, select = -Species)
inputdata.n <- normalize(inputdata, byrow=F)

# computation
som.model <- som(inputdata.n, xdim=4, ydim=4, topol="rect", neigh="gaussian")
print(som.model)

# evaluation
plot(som.model)