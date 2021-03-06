setwd("D:\\Study  Materials\\R Language\\DataSet")
climate_change=read.csv("climate_change.csv")
View(climate_change)

climate_change$rowid=runif(308)

str(climate_change)
summary(climate_change)

#Check if any NA Exists
sum(is.na(climate_change))

set.seed(400)
climate_change_train=subset(climate_change,rowid<=0.7)
climate_change_test=subset(climate_change,rowid>0.7)

#Compute the correlations between all the variables in the dataset except Date & Month. 
cor(subset(climate_change, select = c(-Year,-Month)))

#Which of the following independent variables is N2O highly correlated with (absolute 
#correlation greater than 0.7)? 
#CO2,CH4,CFC.12,Temp

#Find out which variables are highly correlated with the Dependent Variable? 
#CO2,N2O,CFC.12,Temp,CH4

#What will be the prediction of a baseline Model? 
pred=mean(climate_change$Temp)
pred_train=mean(climate_change_train$Temp)

#SST/TSS
sum((climate_change$Temp-pred)^2)
sum((climate_change_train$Temp-pred_train)^2)

#build a linear regression model to predict the dependent variable Temp, using CO2, N2O, 
#CFC.12, and Aerosols as independent variables
colnames(climate_change)[colnames(climate_change)=="CFC.12"]="CFC_12"
colnames(climate_change)[colnames(climate_change)=="CFC.11"]="CFC_11"

#plot Histogram for all Independent variable

hist(climate_change_train$CO2)
hist(climate_change_train$N2O)
hist(climate_change_train$Aerosols)
hist(climate_change_train$CFC.12)

boxplot(climate_change_train$CO2)
boxplot(climate_change_train$N2O)
boxplot(climate_change_train$Aerosols,horizontal=T)
boxplot(climate_change_train$CFC.12)


Q1_Aerosol=quantile(climate_change_train$Aerosols,0.25)
Q2_Aerosol=quantile(climate_change_train$Aerosols,0.50)
Q3_Aerosol=quantile(climate_change_train$Aerosols,0.75)
IQR_Aerosol=Q3_Aerosol-Q1_Aerosol

Q1_CFC.12=quantile(climate_change_train$CFC.12,0.25)
Q2_CFC.12=quantile(climate_change_train$CFC.12,0.50)
Q3_CFC.12=quantile(climate_change_train$CFC.12,0.75)
IQR_CFC.12=Q3_CFC.12-Q1_CFC.12

#Check the outlier percentage

length(which(climate_change_train$Aerosols > Q3_Aerosol+(1.5*IQR_Aerosol)
| climate_change_train$Aerosols < Q1_Aerosol-(1.5*IQR_Aerosol)))/length(climate_change_train$Aerosols)

#14%

length(which(climate_change_train$CFC.12 > Q3_CFC.12+(1.5*IQR_CFC.12)
             | climate_change_train$CFC.12 < Q1_CFC.12-(1.5*IQR_CFC.12)))/length(climate_change_train$CFC.12)

#5.5%
#Both are Having outliers greater than 5%

climate_linreg=lm(Temp~CO2+N2O+Aerosols+CFC.12,data=climate_change)
summary(climate_linreg)

#Which variables are significant in the model? 
CO2,Aerosols,CFC.12

#Remove the insignificant variable and re run the model. What effect did it have on R2 and Adjusted R2? 

climate_linreg_T=lm(Temp~CO2+N2O+Aerosols+CFC.12,data=climate_change_train)
summary(climate_linreg_T)

#What effect did it have on R2 and Adjusted R2?
#Adjusted R2 increased and R2 decreased
#Observe the change closely. Does this validate the definition of R2 & Adj R2?

climate_linreg=lm(Temp~CO2+N2O+Aerosols+CFC.12,data=climate_change)
summary(climate_linreg)

climate_linreg_T=lm(Temp~CO2+Aerosols+CFC.12,data=climate_change_train)
summary(climate_linreg_T)

prediction=predict(climate_linreg_T,newdata=climate_change_test)

#Find the RMSE, SSE and MAPE for the above Model. 

Test_Data_Temp=climate_change_test$Temp-predcition
SSE=(sum(Test_Data_Temp)^2)
R2=1-(SSE/TSS)
R2

#What is the NULL hypothesis in case of the variable Aerosols? 
#Aerosols does not influence Temp ie B=0(H0),alternate Hypothesis B!=0
#if we observe the P value it is leass than 5% so we reject the Null Hypothesis.
