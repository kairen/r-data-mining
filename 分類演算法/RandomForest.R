# 隨機森林

library( "randomForest" )

# training stage
set.seed(100)

# select traning data and prediction data
ind<-sample(2,nrow(iris),replace=TRUE,prob=c(0.8,02))
iris.rf<-randomForest(Species ~.,iris[ind==1,],ntree=50,nPerm=10,mtry=3,proximity=TRUE,importance=TRUE)
print(iris.rf)

# predict
iris.pred<-predict( iris.rf,iris[ind==2,] )

# show the prediction result compare to original
table(observed=iris[ind==2,"Species"],predicted=iris.pred )
