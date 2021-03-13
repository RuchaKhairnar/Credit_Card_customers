
## Now using K-nearest neighbours
kn3<-knn3(as.factor(Attrition_Flag)~.,data =train_data_aa,k=7,prob=TRUE)
summary(kn3)

## we predict using kn3
kn3_predict<-predict(kn3,test_data_aa,type = "class")
plot(kn3_predict)

confusionMatrix(data = as.factor(kn3_predict), reference = test_AF)

##Calculating accuracy
mean(kn3_predict==test_data_aa$Attrition_Flag)




###SVM model 

# Fitting model SVM
svm_model <-svm(Attrition_Flag ~., data = train_data_aa)
summary(svm_model)

#Predict Output 
predicted_SVM<- predict(svm_model,test_data_aa,type="class")
plot(predicted_SVM)

## Here we define any value less than 0.5 to be predicted as 0 and 
##greater than 0.5 to be predicted as 1.
test_data_aa$pred1[predicted_SVM<0.5]<-0
test_data_aa$pred1[predicted_SVM>0.5]<-1
table(a1=test_data_aa$pred1,b=test_data_aa$Attrition_Flag)

##ACcuracy of data
mean(test_data_aa$pred1==test_data_aa$Attrition_Flag)

##Confusion Matrix of the model.
tp_svm<-test_data_aa$pred1%>% factor() 
confusionMatrix(data= tp_svm ,reference = as.factor(test_data_aa$Attrition_Flag ))


