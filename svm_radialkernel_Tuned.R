#svm classification and regression (deterministic linear regression)
library(ISLR)
head(iris)
install.packages ('e1071')
library(e1071)
help("svm")
model<- svm(Species ~., data=iris)
mary(model)
predict.values <- predict(model, iris[1:4])
predict.values
table(predict.values, iris[,5])

#tuning
tune.results<- tune(svm, train.x = iris[1:4],train.y = iris[,5], kernel='radial', ranges =list(cost=c(0.1, 0.5,1.5), gamma=c(0.5,0.7,0.8)))
tune.results
summary(tune.results)
#cost=1.5
#gamma=0.1

tuned.svm <- svm(Species ~., data=iris, kernel='radial', cost=1.5, gamma=0.1)
summary(tuned.svm)
help("svm")




