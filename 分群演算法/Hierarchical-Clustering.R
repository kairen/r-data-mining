# 階層分群演算法
# input data
inputdata <- read.csv(file.choose())

# computation
hc.model <- hclust(dist(inputdata), method="ave")
print(hc.model)

# evaluation
plot(hc.model, hang = -1, labels=inputdata$Species)