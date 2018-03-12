census$over50k=ifelse(census$over50k=='>50K',1,0)
census$over50k=as.factor(census$over50k)
unique(census$over50k)


library(glmnet)
library(caTools)
set.seed(2000)
spl= sample.split(census$over50k, SplitRatio=0.60)
train_census = subset(census, spl==T)
test_census  = subset(census, spl==F)


#Next, build a logistic regression model to predict the dependent variable "over50k", 
#using all of the other variables in the dataset as independent variables. 
#Use the training set to build the model.


logistic_census=glm(over50k~.,data=train_census,family="binomial")
summary(logistic_census)


pred=predict(logistic_census,newdata=test_census,type="response")
pred_class=ifelse(pred>=0.5,1,0)
table(test_census$over50k,pred_class)

#What is the accuracy of the model on the testing set? Use a threshold of 0.5. 
#(You might see a warning message when you make predictions on the test set - you can 
#safely ignore it.)

accuracy=(9051+1888)/nrow(test_census)
accuracy

#What is the area-under-the-curve (AUC) for this model on the test set?

library("ROCR")
ROCR_cart=prediction(pred,test_census$over50k)
ROCCurve_cart=performance(ROCR_cart,"tpr","fpr")
plot(ROCCurve_cart,colorize=T)

#What is the AUC of the CART model on the test set?

auc.temp=performance(ROCR_cart,"auc")
AUC=as.numeric(auc.temp@y.values)
AUC #90.61


#Let us now build a classification tree to predict "over50k". Use the training set to 
#build the model, and all of the other variables as independent variables. Use the default 
#parameters, so don't set a value for minbucket or cp. Remember to specify method="class" 
#as an argument to rpart, since this is a classification problem. After you are done 
#building the model, plot the resulting tree.

library(rpart)
library(rpart.plot)

tree_census=rpart(over50k~.,data=train_census,method="class")
prp(tree_census)

#How many splits does the tree have in total?
#4

#Which variable does the tree split on at the first level (the very first split of the tree)?
#relationship

#Which variables does the tree split on at the second level (immediately after the first 
#split of the tree)? Select all that apply.

#capital gain, education

#What is the accuracy of the model on the testing set? Use a threshold of 0.5. 
#(You can either add the argument type="class", or generate probabilities and use a 
#threshold of 0.5 like in logistic regression.)


nrow(test_census)
pred_cart=predict(tree_census,newdata=test_census,type="class")
table(test_census$over50k,pred_cart)

accuracy=(9243+1596)/nrow(test_census)
accuracy    #84.4%


#Plot the ROC curve for the CART model you have estimated. 
library("ROCR")
pred_cart=predict(tree_census,newdata=test_census)
ROCR_cart=prediction(pred_cart[,2],test_census$over50k) 
ROCCurve_cart=performance(ROCR_cart,"tpr","fpr")
plot(ROCCurve_cart,colorize=T)

#What is the AUC of the CART model on the test set?

auc.temp=performance(ROCR_cart,"auc")
AUC=as.numeric(auc.temp@y.values)
AUC  #84.70

