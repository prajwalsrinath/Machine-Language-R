#set Default working Directory

library(polycor)

setwd("C:/Users/abhic6/Documents")

getwd()

#Load the training and testing sets using the read.csv() function, and 
#save them as variables with the names pisaTrain and pisaTest.

pisaTest=read.csv("pisa2009test.csv")
pisaTrain=read.csv("pisa2009Train.csv")

#How many students are there in the training set?

nrow(pisaTrain)

#Using tapply() on pisaTrain, what is the average reading test score of males &
#Of females??

tapply(pisaTrain$readingScore,pisaTrain$male,mean)

#Which variables have missing data in at least one observation in the training 
#set? 

sapply(pisaTrain,function(x){sum(is.na(x))})
colnames(pisaTrain)[sapply(pisaTrain,function(x){sum(is.na(x))})>0]

sapply(pisaTest,function(x){sum(is.na(x))})
colnames(pisaTest)[sapply(pisaTest,function(x){sum(is.na(x))})>0]

#Removing missing values

str(pisaTrain)
summary(pisaTrain)

pisaTrain$male=factor(pisaTrain$male)
pisaTrain$preschool=factor(pisaTrain$preschool)
pisaTrain$expectBachelors=factor(pisaTrain$expectBachelors)
pisaTrain$motherHS=factor(pisaTrain$motherHS)
pisaTrain$motherBachelors=factor(pisaTrain$motherBachelors)
pisaTrain$motherWork=factor(pisaTrain$motherWork)
pisaTrain$fatherHS=factor(pisaTrain$fatherHS)
pisaTrain$fatherBachelors=factor(pisaTrain$fatherBachelors)
pisaTrain$fatherWork=factor(pisaTrain$fatherWork)
pisaTrain$selfBornUS =factor(pisaTrain$selfBornUS)
pisaTrain$motherBornUS=factor(pisaTrain$motherBornUS)
pisaTrain$fatherBornUS=factor(pisaTrain$fatherBornUS)
pisaTrain$englishAtHome=factor(pisaTrain$englishAtHome)
pisaTrain$computerForSchoolwork=factor(pisaTrain$computerForSchoolwork)
pisaTrain$read30MinsADay=factor(pisaTrain$read30MinsADay)
pisaTrain$schoolHasLibrary=factor(pisaTrain$schoolHasLibrary)
pisaTrain$publicSchool=factor(pisaTrain$publicSchool)
pisaTrain$urban =factor(pisaTrain$urban)


pisaTrain$raceeth[which(is.na(pisaTrain$raceeth))]="White"
pisaTrain$preschool[which(is.na(pisaTrain$preschool))]=1
pisaTrain$expectBachelors[which(is.na(pisaTrain$expectBachelors))]=1
pisaTrain$motherHS[which(is.na(pisaTrain$motherHS))]=1
pisaTrain$motherBachelors[which(is.na(pisaTrain$motherBachelors))]=0
pisaTrain$motherWork[which(is.na(pisaTrain$motherWork))]=1
pisaTrain$fatherHS[which(is.na(pisaTrain$fatherHS))]=1
pisaTrain$fatherBachelors[which(is.na(pisaTrain$fatherBachelors))]=0
pisaTrain$fatherWork[which(is.na(pisaTrain$fatherWork))]=1
pisaTrain$selfBornUS[which(is.na(pisaTrain$selfBornUS))]=1
pisaTrain$motherBornUS[which(is.na(pisaTrain$motherBornUS))]=1
pisaTrain$fatherBornUS[which(is.na(pisaTrain$fatherBornUS))]=1
pisaTrain$englishAtHome[which(is.na(pisaTrain$englishAtHome))]=1
pisaTrain$computerForSchoolwork [which(is.na(pisaTrain$computerForSchoolwork ))]=1
pisaTrain$englishAtHome[which(is.na(pisaTrain$englishAtHome))]=1
pisaTrain$read30MinsADay[which(is.na(pisaTrain$read30MinsADay))]=1
pisaTrain$schoolHasLibrary[which(is.na(pisaTrain$schoolHasLibrary))]=1


hist(pisaTrain$schoolSize,breaks = 50)
median(df_all$minutesPerWeekEnglish,na.rm=1)
mean(df_all$minutesPerWeekEnglish,na.rm=1)

pisaTrain$minutesPerWeekEnglish[is.na(pisaTrain$minutesPerWeekEnglish)] =median(pisaTrain$minutesPerWeekEnglish, na.rm=TRUE)
pisaTrain$studentsInEnglish[is.na(pisaTrain$studentsInEnglish)] =mean(pisaTrain$studentsInEnglish, na.rm=TRUE)
pisaTrain$schoolSize[is.na(pisaTrain$schoolSize)] =median(pisaTrain$schoolSize, na.rm=TRUE)


summary(pisaTrain)

str(pisaTest)

pisaTest$male=factor(pisaTest$male)
pisaTrain$preschool=factor(pisaTest$preschool)
pisaTest$expectBachelors=factor(pisaTest$expectBachelors)
pisaTest$motherHS=factor(pisaTest$motherHS)
pisaTest$motherBachelors=factor(pisaTest$motherBachelors)
pisaTest$motherWork=factor(pisaTest$motherWork)
pisaTest$fatherHS=factor(pisaTest$fatherHS)
pisaTest$fatherBachelors=factor(pisaTest$fatherBachelors)
pisaTest$fatherWork=factor(pisaTest$fatherWork)
pisaTest$selfBornUS =factor(pisaTest$selfBornUS)
pisaTest$motherBornUS=factor(pisaTest$motherBornUS)
pisaTest$fatherBornUS=factor(pisaTest$fatherBornUS)
pisaTest$englishAtHome=factor(pisaTest$englishAtHome)
pisaTest$computerForSchoolwork=factor(pisaTest$computerForSchoolwork)
pisaTest$read30MinsADay=factor(pisaTest$read30MinsADay)
pisaTest$schoolHasLibrary=factor(pisaTest$schoolHasLibrary)
pisaTest$publicSchool=factor(pisaTest$publicSchool)
pisaTest$urban =factor(pisaTest$urban)


pisaTest$raceeth[which(is.na(pisaTest$raceeth))]="White"
pisaTest$preschool[which(is.na(pisaTest$preschool))]=1
pisaTest$expectBachelors[which(is.na(pisaTest$expectBachelors))]=1
pisaTest$motherHS[which(is.na(pisaTest$motherHS))]=1
pisaTest$motherBachelors[which(is.na(pisaTest$motherBachelors))]=0
pisaTest$motherWork[which(is.na(pisaTest$motherWork))]=1
pisaTest$fatherHS[which(is.na(pisaTest$fatherHS))]=1
pisaTest$fatherBachelors[which(is.na(pisaTest$fatherBachelors))]=0
pisaTest$fatherWork[which(is.na(pisaTest$fatherWork))]=1
pisaTest$selfBornUS[which(is.na(pisaTest$selfBornUS))]=1
pisaTest$motherBornUS[which(is.na(pisaTest$motherBornUS))]=1
pisaTest$fatherBornUS[which(is.na(pisaTest$fatherBornUS))]=1
pisaTest$englishAtHome[which(is.na(pisaTest$englishAtHome))]=1
pisaTest$computerForSchoolwork [which(is.na(pisaTest$computerForSchoolwork ))]=1
pisaTest$englishAtHome[which(is.na(pisaTest$englishAtHome))]=1
pisaTest$read30MinsADay[which(is.na(pisaTest$read30MinsADay))]=1
pisaTest$schoolHasLibrary[which(is.na(pisaTest$schoolHasLibrary))]=1

pisaTest$minutesPerWeekEnglish[is.na(pisaTest$minutesPerWeekEnglish)] =median(pisaTest$minutesPerWeekEnglish, na.rm=TRUE)
pisaTest$studentsInEnglish[is.na(pisaTest$studentsInEnglish)] =mean(pisaTest$studentsInEnglish, na.rm=TRUE)
pisaTest$schoolSize[is.na(pisaTest$schoolSize)] =median(pisaTest$schoolSize, na.rm=TRUE)

summary(pisaTest)


#Remove Outliers in Data

boxplot(pisaTrain$studentsInEnglish)
boxplot(pisaTrain$minutesPerWeekEnglish)
boxplot(pisaTrain$schoolSize)
boxplot(pisaTrain$readingScore)

IQRstudentsInEnglish=
  
#Building a model

cor(pisaTrain[,c(1,5,6,7,9,10,12)])
  
pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
pisaTest$raceeth = relevel(pisaTest$raceeth, "White")

linreg1=lm(readingScore~.,data=pisaTrain)

summary(linreg1)

linreg1$coefficients
linreg1$residual
linreg1$fitted.values

#What is the Multiple R-squared value of lmScore on the training set?

(cor(pisaTrain$readingScore,linreg1$fitted.values))^2

#Sum of Squared Error(SSE)

sum(linreg1$residual^2)

#What is the training-set root-mean squared error (RMSE) of lmScore?

(sum(linreg1$residual^2)/nrow(pisaTrain))^0.5

