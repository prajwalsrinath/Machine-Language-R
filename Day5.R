#missing values are denoted as NA in R
#Missing values are a cause of concern and dealt accordingly
x=c(1:5,NA) 
x
mean(x)
mean(x,na.rm=T) #na.rm=T is used to do an operation by ignoring NA
#to check for NA
#x[x==NA], x[x=="NA"] #these donot work as == cannot be used with NA
#is.na
is.na(x)
#to find the no. of NA in a vector
sum(is.na(x))
which(is.na(x))#to find location of NA as a index
#to change NA to some value lets say 0 
#we can use ifelse function
x=ifelse(is.na(x),0,x) # you can use nested ielse also
x
#*************************few important functions***********
x=c(1,43,12,32,0,-5)
sort(x,decreasing = T)#to sort a vector.

x=c(1:5,NA) 
x[x>3]#subseting by index doesnot treat the NA

#subset function treats NA as well
subset(x,x>3)

#==
sports=c("cricket","football","hockey","basketball") 
length(sports)
nchar(sports)
#*****************to confirm datatypes
is.numeric(1)
is.numeric("abc")
is.character("abc")
#factor data types--
#An R factor might be viewed simply as a vector with extra 
#information i.e.  a record of the distinct values in that
#vector, called Levels
is.factor("ABC")
x="ABC"
x=as.factor(x)
is.factor(x)
#+++++++++++++++++++++++++++++
superset= c("A","B","D","E","M","U","T","F","J")
sample=c("Q","A","L","D")
sample[sample %in% superset]
sample %in% superset
which(sample %in% superset) #gives you all indexes of sample 
#which is present in superset
#___
#to get the values in sample which are present in superset
sample[which(sample %in% superset)
#_________find the values in sample not present in Superset
sample[!(sample %in% superset)] 
sample[-which(sample %in% superset)]
x=c(1,2,3)
#paste function
paste("A","B",sep="") 
paste("A","B",sep="+++")
paste(x,"B")#by default sep=" " --> a space
paste(x,"B",sep="--->")

#grep Function (Pattern matching) 
#This function searches for matches to pattern within
#each element of a character vector and returns an
#integer vector of the elements of the vector that
#contain a match 
X = c("apple","potato","grape","10","blue.flower") 
grep("a",X)  #find the index of all elements in X which contain "a"
#to get the values
#option 1
X[grep("a",X)]
#option 2
grep("a",X,value=T) #by default value=F
#--------------------
# strsplit 
#splits a string into a list containing multiple
#strings, based upon a defined delimiter
word="apple|lime|orange"
strsplit(word,"|",fixed=T)
#now you can access individual elements from the output list
strsplit(word,"|",fixed=T)[[1]][2]#example to access lime
#*******Dataframe**********
data(mtcars)
class(mtcars)
View(mtcars)
head(mtcars,5) #mtcars[1:5,]
tail(mtcars,10)
str(mtcars) #to check datatype of each column in a df
#convert to appropriate data types
mtcars$vs=as.factor(mtcars$vs)
mtcars$am=as.factor(mtcars$am)
str(mtcars)
summary(mtcars)
table(mtcars$vs)#this is used only for categoricla columns or columns with few unique values...
table(mtcars$gear)
prop.table(table(mtcars$gear))#if you want percentages
dim(mtcars)#dimenssion
nrow(mtcars);ncol(mtcars)
       
#**************************************************************************#
x=401

if(x%2==0)
  print("The Number is Even")
else
  print("The Number is odd")
 
x=0;
while(x<4)
{
  print(x)
  x=x+1
}
       
#***************************************ggplot2*****************************
#*************** GRAMMAR OF GRAPHICS****************************************
str(mtcars)
hist(mtcars$gear) #histogram can only be used for continuos variables
library(ggplot2)
ggplot(mtcars,aes(x=gear))+geom_bar()
#******************************categorical variables************************************
#to add labels
theme_bw()#-> to get white background
ggplot(mtcars,aes(x=gear))+geom_bar()+labs(x="# of gears",y="Counts",title="Motor Cars")+theme_bw()

#to add color based on a categorical variables
ggplot(mtcars,aes(x=gear,fill=vs))+geom_bar()+labs(x="# of gears",y="Counts",title="Motor Cars")+theme_bw()

#to add a facet (another category)
ggplot(mtcars,aes(x=gear,fill=vs))+geom_bar()+facet_wrap(~ carb)+labs(x="# of gears",y="Counts",title="Motor Cars")+theme_bw()

#******************************numerical variables************************************
#histogram
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth = 1)+labs(x="Mileage",y="Counts",title="Motor Cars")+theme_bw()
#binwidth--> didvide your data into blocks of this number--smaller value means more granular

#mileage with respect to Engine
ggplot(mtcars,aes(x=mpg,fill=vs))+geom_histogram(binwidth = 1)+labs(x="Mileage",y="Counts",title="Motor Cars")+theme_bw()

#box & whisker plot
ggplot(mtcars,aes(x=vs,y=mpg))+geom_boxplot()+labs(x="VS",y="Mileage",title="Motor Cars")+theme_bw()

#_________________advanced plots_____________

#density plots//
ggplot(mtcars,aes(x=mpg,fill=vs))+geom_density(alpha=0.5)+labs(x="Mileage",y="Counts",title="Motor Cars")+theme_bw()

ggplot(mtcars,aes(x=mpg,fill=vs))+facet_wrap(~ gear)+geom_density(alpha=0.5)+
  labs(x="Mileage",y="Counts",title="Motor Cars")+theme_bw()

#multiple facets
ggplot(mtcars,aes(x=mpg,fill=vs))+facet_wrap(am~ gear)+geom_density(alpha=0.5)+
  labs(x="Mileage",y="Counts",title="Motor Cars")+theme_bw()

#Go create your own visualizations and amaze the world!!
