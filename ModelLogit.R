

##Logistic Regression .

 logit_train<- glm(formula = Attrition_Flag ~
                     Dependent_count +
                     scale(Avg_Utilization_Ratio) + 
                     scale(Total_Ct_Chng_Q4_Q1) + 
                     scale(Total_Trans_Ct * Total_Trans_Amt) + 
                     scale(Total_Revolving_Bal) +
                     scale(Months_Inactive_12_mon) + 
                     scale(Contacts_Count_12_mon) + 
                     Gender +
                     Income_Category + 
                     Marital_Status +
                     scale(Total_Ct_Chng_Q4_Q1) + 
                     log(Avg_Open_To_Buy) * Credit_Limit,
                   family = binomial(link = "logit"), data = train_data_aa)
 
 summary(logit_train)

pred_model<- predict(logit_train,newdata = test_data_aa,type = "response") 
qplot(pred_model)
plot(pred_model)


## Here we define any value less than 0.5 to be predicted as 0 and 
##greater than 0.5 to be predicted as 1.

test_data_aa$pred[pred_model<=0.5]<-0
test_data_aa$pred[pred_model>0.5]<-1
table(a1=test_data_aa$pred,b=test_data_aa$Attrition_Flag)

## we factorise the data so as to use it in consfusion matrix.
test_pred<-test_data_aa$pred%>% factor()
test_AF<-as.factor(test_data_aa$Attrition_Flag)
confusionMatrix(test_pred,test_AF)

##Calculate accuracy.
mean(test_data_aa$pred==test_data_aa$Attrition_Flag)


F_meas(test_pred,test_AF)
recall(test_pred,test_AF)
precision(test_pred,test_AF)

