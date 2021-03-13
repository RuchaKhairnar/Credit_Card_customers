# Credit_Card_customers

A manager at the bank is disturbed with more and more customers leaving their credit card services. They would really appreciate if one could predict for them who is gonna get churned so they can proactively go to the customer to provide them better services and turn customers' decisions in the opposite direction
Now, this dataset consists of 10,000 customers mentioning their age, salary, marital_status, credit card limit, credit card category, etc. 


We have only 16.07% of customers who have churned. Thus, it's a bit difficult to train our model to predict churning customers.


I have used 5 different models with different F scores and accuracies on the test set. 
Here's a summary of all 5 methods and their accuracies.
             
             |Model                |  Accuracy  |   Sensitivity | Specificity |
             |-------------------- | ---------- | ------------- | ----------- |
             |Logistic Regression  |  90.85%    |     97.06%    |   47.65%    | 
             |Descision Trees      |  97.33%    |     98.38%    |   89.98%    |
             |Random Forest        |  99.05%    |     99.47%    |   96.11%    |
             |k-Nearest Neighbours |  95.89%    |     98.74%    |   76.07%    |
             |SVM                  |  96.12%    |     99.85%    |   70.14%    |
