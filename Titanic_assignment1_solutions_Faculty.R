#TITANIC assignment

df=read.csv("train.csv")

dim(df) #to get no. of rows & columns

str(df)#data tyoe fo each column
df$PassengerId=as.factor(df$PassengerId)
df$Survived=as.factor(df$Survived)
df$Pclass=as.factor(df$Pclass)
#check again
str(df)
summary(df)
table(df$Survived)#549 did not and 342 survived
prop.table(table(df$Survived))#to get the proportion
table(df$Survived,df$Sex)
table(df$Pclass)
hist(df$Fare,breaks=40)
tapply(df$Fare,df$Pclass,mean,na.rm=T)
table(df$Embarked)
apply(df,2,function(x){sum(is.na(x))}) #slightly advanced function
sum(df$Embarked=="")#embarked has spaces in it..
all_male_P1=subset(df,df$Sex=="male" & df$Pclass==1)
all_female_Age=subset(df,df$Sex=="female"| df$Age<20)
table(df$Survived,df$Pclass) #or tapply(df$Survived,df$Pclass,function(x){sum(x==1)})
table(df$Pclass) #to see total passengers in each class
#****************************************
df_Survived=df[grep("1",df$Survived), ]
dim(df_Survived) 
head(df_Survived)
#______________
df_col_name_with_e=df[, grep("e" ,colnames(df))]
dim(df_col_name_with_e)
#****************************************
#17

sum(is.na(df$Age))
tapply(df$Age,df$Sex,mean,na.rm=T)
df$Age[is.na(df$Age) & df$Sex=="male"]=30.72
df$Age[is.na(df$Age) & df$Sex=="female"]=27.91
sum(is.na(df$Age))

#_____strsplit function--
### finding the FIEST, LAST AND TITLE FROM PASSENGERS NAMES 
head(df$Name)
df$Name[1]
#to split the Name we will have to convert the nmaes to characters first. Y?
#because DataType Factors cannot be changed... All characters are by default read as
#factors when you use the read.csv function.
df$Name=as.character(df$Name)
head(df$Name)#this tells us that to separate the Title , First and last Name
#we will ahve to use , and . as the separator.

strsplit(df$Name[1],"[,.]") # this dpes it and gives frst the Sirname, then Title and 
#the First name. the output is in the form of a list

strsplit(df$Name[1],"[,.]")[[1]][1] # gives the last anme
strsplit(df$Name[1],"[,.]")[[1]][2] #gives the title
strsplit(df$Name[1],"[,.]")[[1]][3] #gives the First Name

#notice the Title and First name has a space before them;;we can repale them with no space
#using the sub(substitute) function
sub("b","d","abc") #means substitute b by d in the string abc

# so to substutute the spaces in Ttile and First name we use
sub(" ","",strsplit(df$Name[1],"[,.]")[[1]][2]) #perfect
sub(" ","",strsplit(df$Name[1],"[,.]")[[1]][3]) #perfect
#nows lets create the columns

df$FirstName=sapply(df$Name,function(x){strsplit(x,"[,.]")[[1]][3]})
#check Check
head(df$FirstName)
#now replace the spaces
df$FirstName=suc(" ", "",df$FirstName)

df$LastName=sapply(df$Name,function(x){strsplit(x,"[,.]")[[1]][1]})
#check Check
head(df$LastName)

df$Title=sapply(df$Name,function(x){strsplit(x,"[,.]")[[1]][2]})
#check Check
head(df$Title)

#now replace the spaces
df$Title=sub(" ","",df$Title)
#check Check
head(df$Title)
