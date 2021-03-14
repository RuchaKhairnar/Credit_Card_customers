
library(ggthemes)
library(plotfunctions)
library(tidyr)
library(ggplot2)
library(moderndive)
library(skimr) 
library(dplyr)
library(tidyverse)
library(readxl)
library(purrr)
library("TeachingDemos")
library("PerformanceAnalytics")
library(corrplot)
library(dummies)
library(caret)
library(generics)
library("e1071")
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(randomForest)
library(effects)
library(e1071)

#drop 3 colnames
data1<-BankChurners[,c(-22,-23,-1)]
colnames(data1)

## Assigning binary values
data1$Attrition_Flag[data1$Attrition_Flag=="Existing Customer"]<-0
data1$Attrition_Flag[data1$Attrition_Flag=="Attrited Customer"]<-1

#Assigning binary values to gender
data1$Gender[data1$Gender=="M"]<-0
data1$Gender[data1$Gender=="F"]<-1

##Naming and changing the class of some of columns 
data1<- data1 %>% 
  summarise("Attrition_Flag"=as.numeric(Attrition_Flag),
            Customer_Age,
            "Gender"=as.factor(Gender),                  
            "Dependent_count"=as.factor(Dependent_count),
            Education_Level,
            Marital_Status,
            Income_Category,
            Card_Category,
            Months_on_book,          
            Total_Relationship_Count, 
            Months_Inactive_12_mon,
            Contacts_Count_12_mon,
            Credit_Limit,
            Total_Revolving_Bal,
            Avg_Open_To_Buy,         
            Total_Amt_Chng_Q4_Q1,
            Total_Trans_Amt,
            Total_Trans_Ct,          
            Total_Ct_Chng_Q4_Q1,
            Avg_Utilization_Ratio)
##Adding "sr" in columns
data1$sr<- 1:nrow(data1)
colnames(data1)

#dividing the data into existed and attributed 
data_exist<- data1 %>% 
  filter(Attrition_Flag==0)

data_attrit<- data1 %>% 
  filter(Attrition_Flag==1)

colnames(data1)
#colnames(data1) <- make.unique(names(data1))


# Created a function called DF to delete NAs.

DF<-function(DF, n=0) {
  DF[rowSums(is.na(DF)) <= n,]
}

set.seed(000)

## Creating training data.
aa1<- data1[sample(data_exist$sr,length(data_exist$sr)*0.6),] %>% DF()
aa2<- data1[sample(data_attrit$sr,length(data_attrit$sr)*0.7),] %>% DF()

train_data_aa<-rbind(aa1,aa2)


##creating testing data
aa3<-setdiff(data_exist$sr,aa1$sr)
test_existaa<-data1[aa3,] %>% DF()

aa4<-setdiff(data_attrit$sr,aa2$sr)
test_attritaa<- data1[aa4,] %>% DF()

test_data_aa<- rbind(test_existaa,test_attritaa)


##Creating Two test sets out of original test data
test_1_data<- data1[sample(test_data_aa$sr,length(test_data_aa$sr)*0.5),]
test_2_data<- setdiff(test_data_aa$sr,test_1_data$sr)
test_2_data<-data1[test_2_data,] %>% DF()


