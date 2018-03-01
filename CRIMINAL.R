crime_test=read.csv("C:/Users/abhic6/Documents/mvtWeek1.csv")

View(crime_test)

nrow(crime_test)

str(crime_test)

max(crime_test$ID)

min(crime_test$Beat)

nrow(crime_test[ which(crime_test$Arrest=='TRUE'),])

nrow(crime_test[ which(crime_test$LocationDescription=='ALLEY'),])

head(crime_test)

???#	Month/Day/Year Hour:Minute

DateConvert = as.Date(strptime(crime_test$Date, "%m/%d/%y %H:%M"))

summary(crime_test)

crime_test$Month = months(DateConvert) 
crime_test$Weekday = weekdays(DateConvert)


library(plyr)

table(crime_test$Weekday)

max(crime_test$Month[table(crime_test$Month)])

hist(crime_test$Month, breaks=100)

boxplot(crime_test$Date ~ crime_test$Arrest)

boxplot(crime_test$Date, ylab = 'Arrest')
,ylab ="Arrest", xlab ="Date")

boxplot(crime_test$Arrest,ylab="Arrest",xlab="Date")

crime_test$Arrest=as.factor(crime_test$Arrest)
crime_test$Domestic=as.factor(crime_test$Domestic)

str(crime_test)