#***************************************************************
#HOMEWORK 1
#PLEASE TRY TO COMPLETE ALL UESTIONS HERE, BEFORE NEXT WEEKS CLASS.
#make sure you revise last weeks Video before starting on this assignment
#THE question for W1 will be simple.. yet they are important
#please writeyour answers in the space provided and run them
#you should know by the output f you are correct or not
#feel free to discuss in the group if you have any questions.
#***************************************************************
#create a folder at a particular place on your system
#1--SETTING wORKING DIRECTORY##################bool#####
#TASK ----make that folder as your working directory

getwd()
setwd("C://Users//abhic6//Documents")

#2--VARIABLE ASSIGNMENT#######################
#A variable allows you to store a value (e.g. 4) or an object
#(e.g. a function description) in R. You can then later use this
#variable's name to easily access the value or the object that is
#stored within this variable. e.g. my_var <- 4 or my_var = 4 is used
#to print the value of a variable just write the name of the variable 
#or use print(variable_name)

#3--BASIC DATA TYPES IN R#######################
#Decimals values like 4.5 are called numerics
#Natural numbers like 4 are called integers. Integers are also numerics.
#Boolean values (TRUE or FALSE) are called logical.
#Text (or string) values are called characters.
#check the data type of a variable. You can do this with the class()

#4--VECTORS
#you create a vector with the combine function c().You place the vector
#elements separated by a comma between the parentheses. For example:
#numeric_vector <- c(1, 2, 3), character_vector <- c("a", "b", "c")
#TASK---assume you are gambling and these are your wins and losses-
#Week1-On Monday you won $140,Tuesday you lost $50,Wednesday you won $20, 
#Thursday you lost $120,Friday you won $240.create a vector called week1 and
#assign the losses and wins to it.
#week2-On Monday you lost $24, Tuesday you lost $50, Wednesday you won $100,
#Thursday you lost $350, Friday you won $10
#a) on which day did you make the most money( taking both weeks into consideration)
#b) What is your overall gain/loss at the end of 2 weeks?
week1=c(140,-50,20,120,240)
week2=c(-24,-50,100,-350,10)


#5--COMPARISON OPERATORS IN R
#
#< for less than
#> for greater than
#<= for less than or equal to
#>= for greater than or equal to
#== for equal to each other
#!= not equal to each other
# try running 6 > 5, What about is expected and why?
#TASK--create a vector with the gdp growth of India in the last 5 years,
#the values are 6.8, 6.6,6.4,5.9,7.2. Call this vector gdp_growth
#these values are for year 2013,2014,2015,2016 & 2017. assign the year as names
#to the vector. Use names function for this.

gdp_growth=c(6.8,6.6,6.4,5.9,7.2)
names(gdp_growth) = c(2013,2014,2015,2016,2017)

#filter out only those year where the gdp growth was >6.5. use vector indexing for this.

gdp_growth[gdp_growth>6.5]

#6--MATRIX
#a matrix is a collection of elements of the same data type 
#(numeric, character, or logical)arranged into a fixed number of rows
#and columns. Since you are only working with rows and columns, 
#a matrix is called two-dimensional.   
#You can construct a matrix in R with the matrix() function.
#Consider the following example:
#  matrix(1:9, byrow = TRUE, nrow = 3)
#The first argument is the collection of elements that R will 
#arrange into the rows and columns of the matrix. 
#Here, we use 1:9 which is a shortcut for c(1, 2, 3, 4, 5, 6, 7, 8, 9)
#The argument byrow indicates that the matrix is filled by the rows.
#If we want the matrix to be filled by the columns, we just place byrow = FALSE
#The third argument nrow indicates that the matrix should have three rows
#TASK--LETS DO AN ASSIGNMENT--
## Box office Star Wars (in millions!)
#new_hope <- c(460.998, 314.4)
#empire_strikes <- c(290.475, 247.900)
#return_jedi <- c(309.306, 165.8)
#region <- c("US", "non-US")
#titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
#Construct a matrix with 3 rows, where each row represents a movie.
#Name the resulting matrix star_wars_matrix.

new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

star_wars_matrix=matrix(c(new_hope,empire_strikes,return_jedi),nrow=3,byrow=T)
star_wars_matrix

#add the names of the movies for the rows.use rownames()function.
rownames(star_wars_matrix)=c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

#add region of collection. use colnames() function.
colnames(star_wars_matrix) = c("US", "non-US")

#calculate the total box office revenue for the three Star Wars movies
colSums(star_wars_matrix)

#google for a function to get the rowsum of a matrix.
rowSums(star_wars_matrix)

#7--Indexing in matrix
#Similar to vectors, you can use the square brackets [ ]
#to select one or multiple elements from a matrix. 
#Whereas vectors have one dimension, matrices have 
#two dimensions. You should therefore use a comma to 
#separate that what to select from the rows from that 
#what you want to select from the columns. For example: 
#e.g. my_matrix[1,2] selects the element at the first row and second column.
# my_matrix[1:3,2:4] results in a matrix with the data on 
#the rows 1, 2, 3 and columns 2, 3, 4. 
#task--from the star_wars_matrix above 

#Select the non-US revenue for all movies 
#(the entire second column of all_wars_matrix), 
#store the result as non_us_all
#Use mean() on non_us_all to calculate 
#the average non-US revenue for all movies. 
non_us_all=star_wars_matrix[,2]
mean(non_us_all)

#This time, select the non-US revenue for the first
#two movies in all_wars_matrix. Store the result as non_us_some
#Use mean() again to print out the average of the values in non_us_some
non_us_some=star_wars_matrix[c(1:2),2]
mean(non_us_some)

#Histogram
#generate 10000 random numbers (use rnorm(n) to generate n random number)
x=rnorm(10000)
#draw a histogram for this. Try to play around with the breaks parameter
hist(x,break=40)
#add color, xlabel, ylabel and title label to the histogram
hist(x,breaks=40,col="blue",
     xlab = "X Axis",ylab = "Count or frequesny",main = "My First Histogram")
#how does the histogram look. Does it ahve a right tail (right skewed),
#left tail(left skewed). How will the mean & median vary in a histogram with
#left right tail. Mean>median in a right skewed histogram?
#is this true? Why? Where is the mean on a histogram plot, where is the median?
#use pen and paper for this understanding.

#for the random numbers generated above find the standard deviation & variance
#of the numbers.. (find manually and using the fuction sd() and var())
#what is the formulae for sd. How does the sd vary for a population and 
#a sample? 

rand_sd=sd(x)
var=(rand_sd)^2
#make sure what sd you find manually in R matches with your excel output..

#do the excel assignment


#Boxplot--
#create a vector with 1000 random numbers. Draw a box plot of this using R.

x_rand=c(runif(1000))

#find the Q1,Q2 & Q3 for this vector. Find the IQR.

q1=quantile(x_rand,.25)
q2=quantile(x_rand,.50)
q3=quantile(x_rand,.75)
IQR=q3-q1

#calcualte the conditions for a point to be called outleir for this dataset
#
# intentionally add an outlier to the above vector.. (how will you add a value
#to an existing vector?? google..)# then draw boxplot again.
x_rand=c(runif(1000),200,-20)
boxplot(x_rand)

#see if the values appears as a outlier in the plot.
#Play around with these.


#***************************************************************
#Good work!! Any doubts on any question. Use the whatsapp group to discuss.
#Enough for this Week.. GO and njoy, Party hard!! Next weeks gona be
#even more exciting..
