
hist(data1$Customer_Age)
hist(data_exist$Customer_Age)
hist(data_attrit$Customer_Age)



##Age plot with density and customer type
ggplot()+
   geom_density(mapping = aes(x=data_exist$Customer_Age),color="red")+
  geom_density(mapping = aes(x=data_attrit$Customer_Age),color="blue")



##Density plot of Dependent count
ggplot()+
 geom_density(mapping = aes(x=Dependent_count),fill="blue",data =data_exist)+
geom_density(mapping = aes(x=Dependent_count),fill="red", data =data_attrit)


##Comparing Histograms of Dependent_count
ggplot()+
  geom_histogram(mapping = aes(x=Dependent_count),data =data1,stat = "count")+
  facet_wrap(~Attrition_Flag,2,1)


##HIGHLY##imp 
##shows density plot of existed and attrited with relationship count
ggplot()+
  geom_density(mapping = aes(x=Total_Relationship_Count),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=Total_Relationship_Count),colour="red", data =data_attrit)


##Shows Differences in average utilization ratio between attrited and existed.
ggplot()+
  geom_density(mapping = aes(x=Avg_Utilization_Ratio),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=Avg_Utilization_Ratio),colour="red", data =data_attrit)


ggplot()+
  geom_density(mapping = aes(x=Total_Ct_Chng_Q4_Q1),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=Total_Ct_Chng_Q4_Q1),colour="red", data =data_attrit)


ggplot()+
  geom_density(mapping = aes(x=scale(Total_Amt_Chng_Q4_Q1)),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=scale(Total_Amt_Chng_Q4_Q1)),colour="red", data =data_attrit)


ggplot()+
  geom_density(mapping = aes(x=Total_Trans_Ct),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=Total_Trans_Ct),colour="red", data =data_attrit)


ggplot()+
  geom_density(mapping = aes(x=Total_Trans_Amt),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=Total_Trans_Amt),colour="red", data =data_attrit)


ggplot()+
  geom_density(mapping = aes(x=log(Avg_Open_To_Buy)),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=log(Avg_Open_To_Buy)),colour="red", data =data_attrit)

ggplot()+
  geom_density(mapping = aes(x=log(Total_Revolving_Bal)),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=log(Total_Revolving_Bal)),colour="red", data =data_attrit)

ggplot()+
  geom_density(mapping = aes(x=Months_Inactive_12_mon),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=Months_Inactive_12_mon),colour="red", data =data_attrit)


ggplot()+
  geom_density(mapping = aes(x=Contacts_Count_12_mon),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=Contacts_Count_12_mon),colour="red", data =data_attrit)

ggplot()+
  geom_density(mapping = aes(x=log(Credit_Limit)),colour="blue",data =data_exist)+
  geom_density(mapping = aes(x=log(Credit_Limit)),colour="red", data =data_attrit)


##CUstomer type with Gender
ggplot()+
  geom_bar(mapping = aes(x=Gender,y=..count../sum(..count..)),fill="red",data = data_attrit)+
  geom_bar(mapping = aes(x=Gender,y=..count../sum(..count..)),data = data_exist)+
  facet_wrap(~Attrition_Flag,ncol = 2)


prop.table(table(data1$Attrition_Flag,data1$Gender))

###just for now
data1$Gender<- as.numeric(data1$Gender)

data1$Dependent_count<- as.numeric(data1$Dependent_count)

cor_data<- data1[,c(-5,-6,-7,-8)]
head(cor_data)


cor_matrix<-cor(cor_data)

corrplot(cor_matrix,method = "color", type = "lower", order = "FPC",
         tl.col = "black", tl.srt = 45)


chart.Correlation(cor_matrix, histogram=TRUE, pch=19)


heatmap(x = cor_matrix, symm = TRUE)


##eda for Categorical data.
ggplot(data = data1,mapping = aes(x=Customer_Age,y=..density..)) + 
  geom_freqpoly(mapping = aes(colour=Education_Level))


ggplot(data=data1)+
geom_boxplot(aes(x=reorder(Income_Category,Customer_Age,FUN = median),y=Customer_Age))


ggplot()+
  geom_bar(mapping = aes(x=Income_Category,y=..count../sum(..count..)),fill="red",data = data_attrit)+
  geom_bar(mapping = aes(x=Income_Category,y=..count../sum(..count..)),data = data_exist)+
  facet_wrap(~Attrition_Flag,ncol = 2)

barplot(prop.table(table("f"=data1$Attrition_Flag,"G"=data1$Income_Category)))

ggplot()+
  geom_bar(mapping = aes(x=Marital_Status,y=..count../sum(..count..)),fill="red",data = data_attrit)+
  geom_bar(mapping = aes(x=Marital_Status,y=..count../sum(..count..)),data = data_exist)+
  facet_wrap(~Attrition_Flag,ncol = 2)

barplot(prop.table(table("f"=data1$Attrition_Flag,"G"=data1$Marital_Status)))


ggplot()+
  geom_bar(mapping = aes(x=Education_Level,y=..count../sum(..count..)),fill="red",data = data_attrit)+
  geom_bar(mapping = aes(x=Education_Level,y=..count../sum(..count..)),data = data_exist)+
  facet_wrap(~Attrition_Flag,ncol = 2)

barplot(prop.table(table("f"=data1$Attrition_Flag,"G"=data1$Education_Level)))

ggplot()+
  geom_bar(mapping = aes(x=Card_Category,y=..count../sum(..count..)),fill="red",data = data_attrit)+
  geom_bar(mapping = aes(x=Card_Category,y=..count../sum(..count..)),data = data_exist)+
  facet_wrap(~Attrition_Flag,ncol = 2)

