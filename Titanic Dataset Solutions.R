library(plyr)
install.packages("plyr")
df_Titanic=read.csv("D:\\Study  Materials\\R Language\\train.csv")

View(df_Titanic)

nrow(df_Titanic)  #no of rows    in df_Titanic
ncol(df_Titanic)  #no of columns in df_Titanic
dim(df_Titanic)   #no of rows and columns
str(df_Titanic)   #check Data Type
count(df_Titanic$Sex) #number of male and female
df_Titanic$PassengerId=as.factor(df_Titanic$PassengerId)
df_Titanic$Survived=as.factor(df_Titanic$Survived)
df_Titanic$Pclass=as.factor(df_Titanic$Pclass)
summary(df_Titanic)
table(df_Titanic$Survived) # Number of Passenger Survived
prop.table(table(df_Titanic$Survived))#to get the proportion
table(df_Titanic$Survived,df_Titanic$Sex)
table(df_Titanic$Pclass)
hist(df_Titanic$Fare)
tapply(df_Titanic$Fare,df_Titanic$Pclass,mean,na.rm=T) #Mean of fair paid by each class
table(df_Titanic$Embarked)
apply(df_Titanic,2,function(x){sum(is.na(x))}) #Number of Missing Value in Each column
sum(df_Titanic$Embarked=='') #Missing value in Embarked


#Dataframe containing First class Male Passengers
df_Titanic_Male_Firstclass=subset(df_Titanic,df_Titanic$Sex=='male'& df_Titanic$Pclass==1)
View(df_Titanic_Male_Firstclass)

#Dataframe with Female Passengers or Age<20

df_Titanic_Female_Age20=subset(df_Titanic,df_Titanic$Sex=='female'|df_Titanic$Age<20)
View(df_Titanic_Female_Age20)

#Male and Female Survived to Respect to class

table(df_Titanic$Survived,df_Titanic$Pclass)

#grep command to Create Number of Passengers survived

df_Survived=df_Titanic[grep("1",df_Titanic$Survived), ]
View(df_Survived)

#Columns having letter 'e' in columnname

df_Titanic[,grep("e",colnames(df_Titanic))] 

#Missing Value of Age for Male and Female based on Average


sum(is.na(df$df_Titanic))
tapply(df$Age,df$Sex,mean,na.rm=T)
df_Titanic$Age[is.na(df_Titanic$Age) & df_Titanic$Sex=="male"]=30.72
df_Titanic$Age[is.na(df_Titanic$Age) & df_Titanic$Sex=="female"]=27.91
sum(is.na(df$Age))

#Creating new column

df_Titanic$Name=as.character(df_Titanic$Name)
View(strsplit(df_Titanic$Name[1],"[,.]"))
View(strsplit(df_Titanic$Name[1],"[,.]")[[1]][1])
View(strsplit(df_Titanic$Name[1],"[,.]")[[1]][2])
View(strsplit(df_Titanic$Name[1],"[,.]")[[1]][3])


#substutute the spaces in Ttile and First name we use

sub(" ","",strsplit(df_Titanic$Name[1],"[,.]")[[1]][2]) #perfect
sub(" ","",strsplit(df_Titanic$Name[1],"[,.]")[[1]][3]) #perfect
#nows lets create the columns

df_Titanic$FirstName=sapply(df_Titanic$Name,function(x){strsplit(x,"[,.]")[[1]][3]})
df_Titanic$LastName=sapply(df_Titanic$Name,function(x){strsplit(x,"[,.]")[[1]][1]})
df_Titanic$Title=sapply(df_Titanic$Name,function(x){strsplit(x,"[,.]")[[1]][2]})

View(df_Titanic)


