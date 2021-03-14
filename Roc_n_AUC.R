##calculating roc and auc for logit model

## Changing bcak plot region to square
par(pty = "s")

##create ROC curve
roc.info_logit<-roc(test_data_aa$Attrition_Flag,
    pred_model ,plot=TRUE,
    legacy.axes=TRUE, xlab="False Positive Percentage", ylab="True Postive Percentage",
    col="#377eb8",print.auc=TRUE,lw=4)



str(roc.info_logit)

## put the values in a dataframe to have a better look at sensitivities and specificities 
roc.df_logit <- data.frame(
  tpp=roc.info_logit$sensitivities*100, ## tpp = true positive percentage
  fpp=(1 - roc.info_logit$specificities)*100, ## fpp = false positive precentage
  thresholds=roc.info_logit$thresholds)

head(roc.df_logit,40)
tail(roc.df_logit)



## calculating roc and auc for svm
par(pty = "s")


##create ROC curve for svm model
roc.info_svm<-roc(test_data_aa$Attrition_Flag,
              predicted_SVM ,plot=TRUE,
              legacy.axes=TRUE, xlab="False Positive Percentage",
              ylab="True Postive Percentage",
              col="#377eb8",print.auc=TRUE,lw=4)


str(roc.info_svm)

roc.df_svm <- data.frame(
  tpp=roc.info_svm$sensitivities*100, ## tpp = true positive percentage
  fpp=(1 - roc.info_svm$specificities)*100, ## fpp = false positive precentage
  thresholds=roc.info_svm$thresholds)
head(roc.df_svm,40)
tail(roc.df_svm)


## Changing bcak plot region to max size
par(pty = "m")



