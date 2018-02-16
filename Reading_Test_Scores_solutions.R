pisaTrain=read.csv("pisa2009train.csv")
pisaTest=read.csv("pisa2009test.csv")
dim(pisaTrain)
#1.2
tapply(pisaTrain$readingScore,pisaTrain$male,mean)#1 -Male, 0- Female
#1.3
sapply(pisaTrain,function(x){sum(is.na(x))}) #gives all counts
#from above select all >0's
colnames(pisaTrain)[sapply(pisaTrain,function(x){sum(is.na(x))})>0]
#***********8repeat above for test
colnames(pisaTest)[sapply(pisaTest,function(x){sum(is.na(x))})>0]

#1.4
#simce I have to fill the mssing values in each of the columns in both train and test
#i wil have to fill the nas in train and then in test, 2 times...
#to avoid this i will merge them and then fill for the merged dataset and after filling it
#split it back in the ratoi as they were earlier
df_all=rbind(pisaTrain,pisaTest)
dim(df_all)
#now fill na here

colnames(df_all)[sapply(df_all,function(x){sum(is.na(x))})>0]
str(df_all)
#fill raceeth
table(df_all$raceeth)
#fill missing with Mode.i.e White
df_all$raceeth[is.na(df_all$raceeth)]="White"


#fill minutesPerWeekEnglish with the median as it is right tailed
hist(df_all$minutesPerWeekEnglish,breaks = 50)
median(df_all$minutesPerWeekEnglish,na.rm=1)
mean(df_all$minutesPerWeekEnglish,na.rm=1)

df_all$minutesPerWeekEnglish[is.na(df_all$minutesPerWeekEnglish)]=median(df_all$minutesPerWeekEnglish,na.rm=1)

#SIMILARLY FILL FOR ALL MISING COLUMNS.... YES FILLING MISSING VALUES IS A PAIN...
#IT AHS TO BE DONE ONE COLUMN AT A TIME...
# but.......


install.packages("mice")
#
# THERE IS A PACKAGE CALLED MICE WHICH HELPS US DO THAT AUTOMATICALLY
#INSTALL THE PACKAGE
library("mice")
#let se ehow it works..
filled_data <- mice(df_all,m=2,meth='pmm',seed=500)
#seed=500 is use to recreate the results.

#meth='pmm'--->>refers to the imputation method. In this case we are 
#using predictive mean matching as imputation methodmice package used the
#other values that are present in each column to fill
#the missings in the same column

#m=2 refers to the number of imputed datasets. Five is the default value.

completedData <- complete(filled_data ,2) #select the first dataset out of m=2
#now check if the data is filled in completedData
sapply(completedData,function(x){sum(is.na(x))}) #yeah, all good

#split back in the same ratoi as train & test
pisaTrain_filled=head(completedData,nrow(pisaTrain))
pisaTest_filled=head(completedData,nrow(pisaTest))


#2.1
#male & Raceeth

#2.1 
#grade

#2.2
table(completedData$raceeth)
#except white all will be considered

#2.3
#a--all will be set to 0

#b--all of them

#3.1
pisaTrain_filled$raceeth = relevel(pisaTrain_filled$raceeth, "White")
pisaTest_filled$raceeth = relevel(pisaTest_filled$raceeth, "White")

lmScore=lm(readingScore ~ .,data=pisaTrain_filled)
summary(lmScore)
#0.3617

#3.2
RMSE_training=((sum(lmScore$residuals^2))/nrow(pisaTrain_filled))^0.5
RMSE_training

#3.3
#co-efficient of grade is 33
#so 2*33=66
#closest answer is 59.09

#3.4
#Predicted difference in the reading score between an Asian student and a 
#white student who is otherwise identical

#3.5
#preschool, motherWork, fatherHS , fatherWork, selfBornUS, motherBornUS, fatherBornUS
#studentsInEnglish, schoolHasLibrary

#4.1
predTest=predict(lmScore,newdata=pisaTest_filled)
summary(predTest)

#4.2
SSE=(sum(pisaTest_filled$readingScore - predTest)^2)

RMSE=(SSE/nrow(pisaTest_filled))^0.5
RMSE

#4.3
baseline_pred=mean(pisaTrain_filled$readingScore)
baseline_pred
SST=(sum(pisaTest_filled$readingScore - baseline_pred)^2)

#4.4
R2=1-(SSE/SST)
R2
