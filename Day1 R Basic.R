#fix your working directory
setwd("C:\\Users\\singh\\Desktop\\My Learnings\\2018\\R_Jan2018\\Day1")

rm(list=ls())# delete files in R history

#install & Load a package
install.packages("ggplot2")
library("ggplot2")
installed.packages()  #to see all the installed packages
#***************basic Operations in R*********************
#arithmetic           ---   =,<-, +, -, *,/,%%,^ 
#relational           ---   >=, <=, ==,!= 
#logical              ---   & ,| 
#create a sequence    ---   :(1:10  #print from 1 to 10),seq #seq(2,20,2)

x=2   #Assign 2 to x
x<-2  #Assign 2 to x,= and <- do the same

#Built-in Functions 
#log (x),log(x,n),sqrt(x),factorial(x),floor(x),ceiling(x),
#round(x,digits=0),abs(x),runif(n) &

#data types in R

#Vectors : collection of Element of Same DataType
x=c(1,2,3,4,2,1,1)
print(x)
course_name=c("Zero2","Hero")
print(course_name)
class(course_name)#to check the dtype of an object
temp=c(1,234,"Bangalore")
print(temp)
class(temp)
temp[4] #indexing in R, starts from 1
x=c(2,11,22,33,44)
x[3:5]
x[c(3,4,5)]
x[-1]#all but the first index
#Important vector functions
sum(x)
length(x)
max(x)
min(x)
mean(x)
median(x)
