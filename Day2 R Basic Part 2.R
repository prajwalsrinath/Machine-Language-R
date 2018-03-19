random_num=runif(5000)
hist(random_num,breaks=40,col="blue",
     xlab = "X Axis",ylab = "Count or frequesny",main = "My First Histogram")

#matrix
x=matrix(1:10,nrow = 5,byrow = T)#by default byrow=F
print(x)
x2=matrix(1:10,nrow=5,ncol = 4)
print(x2)
#indexing in 2D
x2[2,1] # 2nd row and 1st col
#to get all rows in 1st col
x2[,1]
class(x2)
class(x2[,1])
#if you want all columns in 3rd row
x2[3,]
colnames(x2)=c("A","B","C","D")
print(x2)
rownames(x2)=c('P','Q','R','S','Y')
print(x2)
x2[2,3]
x2["S",]
x2[,"A"]
#subset vectors
x=c(3,2,6,4,11,12,0)
x[(x<3) | (x>10)] # & and --->  | or
x[x!=3]

#data frames== sql table=excel spreadsheet
#each column is a vector
#Age, EmpID, Name, Income, 

#boxplots
x1=c(1:100)
x2=c(-5,1000)
x=c(x1,x2)
boxplot(x,main="My first box plot",ylab="Age")
x_new=x[x<200]
Q2=quantile(x,0.5)
Q1=quantile(x,0.25)
Q3=quantile(x,0.75)
IQR=Q3-Q1
#outliers
upperlimit= IQR*1.5+Q3
lowerlimit= Q1-IQR*1.5
x_new=x[(x>lowerlimit) & (x<upperlimit)]
x_new
#standard deviation
x
age=c(5,10,15,32,20)
sd(age)






