setwd("D:\\Study  Materials\\R Language\\DataSet")

climate_change=read.csv("climate_change.csv")
climate_change$rowid=runif(308)

str(climate_change)
summary(climate_change)

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

#SST/TSS
sum((climate_change$Temp--pred)^2)

#build a linear regression model to predict the dependent variable Temp, using CO2, N2O, 
#CFC.12, and Aerosols as independent variables
colnames(climate_change)[colnames(climate_change)=="CFC-12"]="CFC_12"
colnames(climate_change)[colnames(climate_change)=="CFC-11"]="CFC_11"

climate_linreg=lm(Temp~CO2+N2O+Aerosols+CFC_12,data=climate_change)
summary(climate_linreg)


