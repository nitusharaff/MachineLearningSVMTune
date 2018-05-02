

train= read.csv("D:\\data\\dt\\final_no_chi30.csv" ,stringsAsFactors= FALSE )
library(e1071)
library(parallelSVM)
library(caret)
library(Metrics)


obj <- tune(svm, soldQuantity~., data = trainset, 
            ranges = list(gamma = seq(0.1,0.6,0.1), cost = seq(10,18,1)),
            tunecontrol = tune.control(sampling = "fix")
)

print obj

now <- Sys.time()
now
svm.model <- svm(soldQuantity~., data = trainset,type="eps-regression", kernel="radial", gamma =0.5, cost=16)
again<- Sys.time()
again
timetaken<- again-now
timetaken

testset[testset=="na"] <- 0

svm.pred<- predict(svm.model,testset)

d<- as.data.frame(svm.pred)
pred<- as.numeric(as.character(d$svm.pred))
r2<- 1 - sum((testset$soldQuantity-pred)^2)/sum((testset$soldQuantity-mean(testset$soldQuantity))^2)
r<- round(pred,digits=-2)
rmse(testset$soldQuantity,r)


       


plot(testset$soldQuantity,pred, xlim=c(0,1000), ylim=c(0,1000))

