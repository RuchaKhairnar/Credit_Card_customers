# Credit_Card_customers

A manager at the bank is disturbed with more and more customers leaving their credit card services. They would really appreciate if one could predict for them who is gonna get churned so they can proactively go to the customer to provide them better services and turn customers' decisions in the opposite direction
Now, this dataset consists of 10,000 customers mentioning their age, salary, marital_status, credit card limit, credit card category, etc. 
We have only 16.07% of customers who have churned. Thus, it's a bit difficult to train our model to predict churning customers.
I have used 5 different models with different F scores and accuracies on the test set. 
Here's a summary of all 5 methods and their accuracies.
             
             |Model                |  Accuracy  |   Sensitivity | Specificity |
             |-------------------- | ---------- | ------------- | ----------- |
             |Logistic Regression  |  90.18%    |     96.88%    |   42.94%    | 
             |Descision Trees      |  96.61%    |     97.32%    |   91.62%    |
             |Random Forest        |  98.74%    |     99.26%    |   95.09%    |
             |k-Nearest Neighbours |  94.65%    |     96.59%    |   81.19%    |
             |SVM                  |  96.09%    |     99.06%    |   75.46%    |
