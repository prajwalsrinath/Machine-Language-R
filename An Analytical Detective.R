setwd("C:\\Users\\abhic6\\Documents")

Detective_Analysis=read.csv("mvtWeek1.csv")
View(Detective_Analysis)

#How many rows of data (observations) are in this dataset?
nrow(Detective_Analysis)

#How many variables are in this dataset?
names(Detective_Analysis)
ncol(Detective_Analysis)

#Using the "max" function, what is the maximum value of the variable "ID"?
max(Detective_Analysis$ID)

#What is the minimum value of the variable "Beat"?
min(Detective_Analysis$Beat)

#How many observations have value TRUE in the Arrest variable 
summary(Detective_Analysis) 

#In what format are the entries in the variable Date?
#Month/Day/Year Hour:Minute

#What is the month and year of the median date in our dataset?

Detective_Analysis$DateConvert = as.Date(strptime(Detective_Analysis$Date, "%m/%d/%y %H:%M"))
#2006-05-21

Detective_Analysis$Month = months(DateConvert)
Detective_Analysis$Weekday = weekdays(DateConvert)

#In which month did the fewest motor vehicle thefts occur?
table(Detective_Analysis$Month)

#On which weekday did the most motor vehicle thefts occur?
table(Detective_Analysis$Weekday)

#Which month has the largest number of motor vehicle thefts for which an arrest was made?
table(Detective_Analysis$Month,Detective_Analysis$Arrest)

#For what proportion of motor vehicle thefts in 2001 was an arrest made?
table(Detective_Analysis$Arrest,Detective_Analysis$Year)
2152/(18517+2152)

#For what proportion of motor vehicle thefts in 2007 was an arrest made?
table(Detective_Analysis$Arrest,Detective_Analysis$Year)
1212/(13068+1212)

#For what proportion of motor vehicle thefts in 2012 was an arrest made?
table(Detective_Analysis$Arrest,Detective_Analysis$Year)
550/(13542+550)

#Which locations are the top five locations for motor vehicle thefts, excluding the 
#"Other" category? You should select 5 of the following options.
head(sort(table(Detective_Analysis$LocationDescription),decreasing=TRUE),6)

#Create a subset of your data, only taking observations for which the theft 
#happened in one of these five locations, and call this new data set "Top5".
TopLocations = c("STREET", "PARKING LOT/GARAGE(NON.RESID.)", "ALLEY", "GAS STATION", "DRIVEWAY - RESIDENTIAL")
Top5=subset(Detective_Analysis,Detective_Analysis$LocationDescription%in%TopLocations)

#How many observations are in Top5?
nrow(Top5)

#One of the locations has a much higher arrest rate than the other locations
table(Top5$LocationDescription,Top5$Arrest)

#On which day of the week do the most motor vehicle thefts at gas stations happen?
table(Top5$LocationDescription,Top5$Weekday)

#On which day of the week do the fewest motor vehicle thefts in residential driveways happen?
table(Top5$LocationDescription,Top5$Weekday)
