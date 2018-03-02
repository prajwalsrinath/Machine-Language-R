crime_test=read.csv("C:/Users/abhic6/Documents/mvtWeek1.csv")

View(crime_test)

#How many rows of data (observations) are in this dataset?

nrow(crime_test)

#How many variables are in this dataset?
  
str(crime_test)

#Using the "max" function, what is the maximum value of the variable "ID"?

max(crime_test$ID)

#What is the minimum value of the variable "Beat"?

min(crime_test$Beat)

#How many observations have value TRUE in the Arrest variable (this is the number of 
#crimes for which an arrest was made)?

nrow(crime_test[ which(crime_test$Arrest=='TRUE'),])

#	How many observations have a LocationDescription value of ALLEY?

nrow(crime_test[ which(crime_test$LocationDescription=='ALLEY'),])

head(crime_test)

???#	Month/Day/Year Hour:Minute

#convert these characters into a Date object in R. 
  
crime_test$DateConvert = as.Date(strptime(crime_test$Date, "%m/%d/%y %H:%M"))

summary(crime_test)

crime_test$Month = months(DateConvert) 
crime_test$Weekday = weekdays(DateConvert)

#	On which weekday did the most motor vehicle thefts occur?
  
table(crime_test$Weekday)

#Which month has the largest number of motor vehicle thefts for which an arrest was made?
  
max(crime_test$Month[table(crime_test$Month)])

#histogram of the variable Date

hist(crime_test$DateConvert, breaks=100)

#	In general, does it look like crime increases or decreases from 2002 - 2012?
# Decrease
#	In general, does it look like crime increases or decreases from 2005 - 2008?
# Decrease
#	In general, does it look like crime increases or decreases from 2009 - 2011?
# Increase  

#Create a boxplot of the variable "Date", sorted by the variable "Arrest" 

boxplot(crime_test$Date ~ crime_test$Arrest)

boxplot(crime_test$Date, ylab = 'Arrest',xlab ="Date")

boxplot(crime_test$DateConvert,ylab="Arrest",xlab="DateConvert")

#For what proportion of motor vehicle thefts in 2001 was an arrest made? 

table(crime_test$Arrest, crime_test$Year)

2152/(2152+18517)

#For what proportion of motor vehicle thefts in 2007 was an arrest made?

1212/(1212+13068)

#For what proportion of motor vehicle thefts in 2012 was an arrest made?

550/(550+13542)
  

#Which locations are the top five locations for motor vehicle thefts, excluding the "Other" category? 

sort(table(crime_test$LocationDescription))


#Create a subset of your data, only taking observations for which the theft happened in one of these five locations,
#and call this new data set "Top5". To do this, you can use the | symbol. In lecture, we used the & symbol to use two 
#criteria to make a subset of the data. To only take observations that have a certain value in one variable or the other, 
#the | character can be used in place of the & symbol. This is also called a logical "or" operation. Alternately, 
#you could create five different subsets, and then merge them together into one data frame using rbind. How many observations are 
#in Top5?
  
TopLocations = c("STREET", "PARKING LOT/GARAGE(NON.RESID.)", "ALLEY", "GAS STATION", "DRIVEWAY - RESIDENTIAL")
Top5 = subset(crime_test, LocationDescription %in% TopLocations)
View(Top5)

#	On which day of the week do the most motor vehicle thefts at gas stations happen?

table(crime_test$LocationDescription, crime_test$Weekday) #saturday

#	On which day of the week do the fewest motor vehicle thefts in residential driveways happen?

