![Rplot01](https://user-images.githubusercontent.com/75317048/111114927-f5748500-8589-11eb-967d-45bedf985d7e.png)
# Credit_Card_customers

A manager at the bank is disturbed with more and more customers leaving their credit card services. They would really appreciate if one could predict for them who is gonna get churned so they can proactively go to the customer to provide them better services and turn customers' decisions in the opposite direction Now, this dataset consists of 10,000 customers mentioning their age, salary, marital_status, credit card limit, credit card category, etc.

We have only 16.07% of customers who have churned. Thus, it's a bit difficult to train our model to predict churning customers.

I have used 4 different models with different F scores and accuracies on the test set. Here's a summary of all 5 methods and their accuracies.

             |Model                |  Accuracy  |   Sensitivity | Specificity |
             |-------------------- | ---------- | ------------- | ----------- |
             |Logistic Regression  |  80.05%    |     81.06%    |   73.01%    | 
             |Descision Trees      |  97.33%    |     98.38%    |   89.98%    |
             |Random Forest        |  99.05%    |     99.47%    |   96.11%    |
             |SVM                  |  95.45%    |     95.79%    |   93.05%    |

In our case, it is clear that random forest gives the best prediction for attrited data and hence it is an appropriate choice of model.

The R_code file contains one main test data which is then further divided into two test datas i.e. test_1\_data and test_2\_data to check for overfitting. The train and test sets are divided in a way to include both attrited and existing customers . This is done by including a constant proportion of randomly selected attrited and existing data into the training and testing sets.

The Roc_n\_AUC file contains the code used for determining the threshold value of the predictions of logit and svm model.

The ROC curve of Logit model below gives best combination of specificity and sensitivity when their values range from 60 to 80 %
![Rplot02](https://user-images.githubusercontent.com/75317048/111115034-14731700-858a-11eb-938e-f8ea19b23e26.png)



The ROC curve for SVM model is considerably right angled with high AUC so we can expect high values of sensitivity and specificity with low tradeoff
![Rplot01](https://user-images.githubusercontent.com/75317048/111114991-091feb80-858a-11eb-979e-04006ec51459.png)

Note - The 'False Positive Percentage' value is obtained using the formula ' 1- specificity ' . Hence we aim at lowering FPP (increasing sensitivity) and increasing TPP.
