
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

#dividing the data into existed and attributed 
data_exist<- data1 %>% 
  filter(Attrition_Flag==0)

data_attrit<- data1 %>% 
  filter(Attrition_Flag==1)

colnames(data1)
colnames(data1) <- make.unique(names(data1))

