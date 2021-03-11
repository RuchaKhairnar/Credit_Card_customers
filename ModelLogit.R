odel
pred_model<- predict(logit_train,newdata = test_data,type = "response") 
qplot(pred_model)
plot(pred_model)


## Here we define any value less than 0.5 to be predicted as 0 and 
##greater than 0.5 to be predicted as 1.

test_data$pred[pred_model<=0.5]<-0
test_data$pred[pred_model>0.5]<-1
table(a1=test_data$pred,b=test_data$Attrition_Flag)

## we factorise the data so as to use it in consfusion matrix.
test_pred<-test_data$pred%>% factor()
test_AF<-as.factor(test_data$Attrition_Flag)
confusionMatrix(test_pred,test_AF)

##Calculate accuracy.
mean(test_data$pred==test_data$Attrition_Flag)


F_meas(test_pred,test_AF)
recall(test_pred,test_AF)
precision(test_pred,test_AF)

