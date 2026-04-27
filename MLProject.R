install.packages(c("caret", "MASS", "e1071", "randomForest"), dependencies=TRUE)

# Load library
library(caret)

# Load dataset
data(iris)
dataset <- iris

# Split into training (80%) and validation (20%)
set.seed(7)
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
validation <- dataset[-validation_index,]
dataset <- dataset[validation_index,]

# Basic exploration
dim(dataset)
sapply(dataset, class)
head(dataset)
levels(dataset$Species)

# Class distribution
percentage <- prop.table(table(dataset$Species)) * 100
cbind(freq=table(dataset$Species), percentage=percentage)

# Summary stats
summary(dataset)

# Split into input (x) and output (y)
x <- dataset[,1:4]
y <- dataset[,5]

# Boxplots
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(x[,i], main=names(dataset)[i])
}

# Class plot
plot(y)

# Feature relationships
featurePlot(x=x, y=y, plot="ellipse")
featurePlot(x=x, y=y, plot="box")

scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

# Train control
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# Train models
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)

set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)

set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)

set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)

set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)

# Compare models
results <- resamples(list(
  lda=fit.lda,
  cart=fit.cart,
  knn=fit.knn,
  svm=fit.svm,
  rf=fit.rf
))
summary(results)

# compare accuracy of models
dotplot(results)

# summarize Best Model
print(fit.lda)

# estimate skill of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)

