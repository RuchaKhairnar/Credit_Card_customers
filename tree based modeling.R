

##Here we use decision tree model
tree_model<-rpart(Attrition_Flag~.,data =train_data,method = "class")
summary(tree_model)

##Plotting the tree model
plot(tree_model)
fancyRpartPlot(tree_model,sub = NA)

#Then predicting the model using test data
pred_tree_model<-predict(tree_model,test_data,type = "class")
plot(pred_tree_model)

table(pred_tree_model,test_data$Attrition_Flag)
##calculating the accuracy.
mean(pred_tree_model==test_data$Attrition_Flag)

sum(is.na(train_data$Education_Level))


##Using Random Forest model
my_forest<-randomForest(as.factor(Attrition_Flag)~.,data =train_data,importance=TRUE,ntree=1000)
varImpPlot(my_forest)

##predicting model
predict_forest<- predict(my_forest,test_data)
plot(predict_forest)
## calculating accuracy of the random forest model.

mean(predict_forest==test_data$Attrition_Flag)

