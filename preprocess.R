

#train= read.csv("D:\\data\\dt\\final_no_chi30withsq.csv" ,stringsAsFactors= FALSE )

library(caret)
library(Metrics)


train$endAt.x<-as.numeric(as.POSIXct(train$endAt.x))
train$says.id<-match(train$says.id, unique(train$says.id))
#train$says.emailContent<-match(train$says.emailContent, unique(train$says.emailContent))
train$says.title<-match(train$says.title, unique(train$says.title))
train$deal.type1.id<-match(train$deal.type1.id, unique(train$deal.type1.id))
train$deal.type2.id<-match(train$deal.type2.id, unique(train$deal.type2.id))
train$deal.type1.name<-match(train$deal.type1.name, unique(train$deal.type1.name))
train$deal.type2.name<-match(train$deal.type2.name, unique(train$deal.type2.name))
train$Merchant.uuid<-match(train$Merchant.uuid, unique(train$Merchant.uuid))
train$display.option.4.value<-match(train$display.option.4.value, unique(train$display.option.4.value))



train$categories1<-match(train$categories1, unique(train$categories1))
train$categories2<-match(train$categories2, unique(train$categories2))
train$categories3<-match(train$categories3, unique(train$categories3))
train$categories4<-match(train$categories4, unique(train$categories4))


train$startAt<-as.numeric(as.POSIXct(train$startAt))
train$endAt.y<-as.numeric(as.POSIXct(train$endAt.y))
train$expiresAt<-as.numeric(as.POSIXct(train$expiresAt))


train$division.id<-match(train$division.id, unique(train$division.id))
train$division.name<-match(train$division.name, unique(train$division.name))
train$display.option.4.value<-match(train$display.option.4.value, unique(train$display.option.4.value))
train$status.y<-match(train$status.y, unique(train$status.y))
train$state.code<-match(train$state.code, unique(train$state.code))



train[train=="na"] <- 0


write.csv(train, "D:\\data\\dt\\formattedfinal31.csv")


train$review2.time<- as.integer(as.character(train$review2.time))
train$review3.time<- as.integer(as.character(train$review3.time))

train$review2.rating<- as.integer(as.character(train$review2.rating))
train$review3.rating<- as.integer(as.character(train$review3.rating))

train$expiresInDays[train$expiresInDays=="na"] <- 0
train$expiresInDays<- as.integer(as.character(train$expiresInDays))

train$maximumPurchaseQuantity[train$maximumPurchaseQuantity=="na"] <- 0
train$maximumPurchaseQuantity<- as.numeric(as.factor(train$maximumPurchaseQuantity))


