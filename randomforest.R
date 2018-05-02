
index <- 1:nrow(train)
testindex <- sample(index, trunc(length(index)/3))
testset <- train[testindex,]
trainset <- train[-testindex,]
trainset[trainset=="na"] <- 0


now <- Sys.time()
now
r.model <- randomForest(soldQuantity~., data = trainset, mtry=3,
                         importance=TRUE, na.action=na.omit)

pred <- predict(r.model, testset)

again<- Sys.time()
again
timetaken<- again-now
timetaken

r2<- 1 - sum((testset$soldQuantity-pred)^2)/sum((testset$soldQuantity-mean(testset$soldQuantity))^2)
r<- round(pred,digits=-2)
rmse(testset$soldQuantity,r)
plot(testset$soldQuantity,pred, xlim=c(0,1000), ylim=c(0,1000))
