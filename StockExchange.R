CocaCola=read.csv("C:\\Users\\abhic6\\Documents\\R\\CocaColaStock.csv")
ProcterGamble=read.csv("C:\\Users\\abhic6\\Documents\\R\\ProcterGambleStock.csv")
GE=read.csv("C:\\Users\\abhic6\\Documents\\R\\GEStock.csv")
IBM=read.csv("C:\\Users\\abhic6\\Documents\\R\\IBMStock.csv")
Boeing=read.csv("C:\\Users\\abhic6\\Documents\\R\\BoeingStock.csv")

IBM$Date = as.Date(IBM$Date, "%m/%d/%y")
GE$Date = as.Date(GE$Date, "%m/%d/%y")
CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")
ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")
Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")

str(IBM)

#Our five datasets all have the same number of observations. How many observations are there 
#in each data set?

nrow(CocaCola)
nrow(IBM)
nrow(GE)
nrow(Boeing)
nrow(ProcterGamble)

#What is the earliest year in our datasets?
min(format(ProcterGamble$Dat,"%Y"))

#What is the latest year in our datasets?
max(format(ProcterGamble$Dat,"%Y"))

#What is the mean stock price of IBM over this time period?
mean(IBM$StockPrice)

#What is the minimum stock price of General Electric (GE) over this time period?
min(GE$StockPrice)

#What is the maximum stock price of Coca-Cola over this time period?
max(CocaCola$StockPrice)

#What is the median stock price of Boeing over this time period?
median(Boeing$StockPrice)

#What is the standard deviation of the stock price of Procter & Gamble over this time period?
sd(ProcterGamble$StockPrice)

#Let's plot the stock prices to see if we can visualize trends in stock prices during this 
#time period. Using the plot function, plot the Date on the x-axis and the StockPrice on 
#the y-axis, for Coca-Cola.

plot(CocaCola$Date,CocaCola$StockPrice,type="l")

#Around what year did Coca-Cola has its highest stock price in this time period?
#1973

#Around what year did Coca-Cola has its lowest stock price in this time period?
#1980

#let's add the line for Procter & Gamble too. You can add a line to a plot in R by using 
#the lines function instead of the plot function
lines(ProcterGamble$Date,ProcterGamble$StockPrice)

#Unfortunately, it's hard to tell which line is which. Let's fix this by giving each line a 
#color. First, re-run the plot command for Coca-Cola, but add the argument col="red". 

plot(CocaCola$Date,CocaCola$StockPrice,type="l",col="red")
lines(ProcterGamble$Date,ProcterGamble$StockPrice,col="blue")
lines(ProcterGamble$Date,ProcterGamble$StockPrice,lty=2)

#In March of 2000, the technology bubble burst, and a stock market crash occurred. According 
#to this plot, which company's stock dropped more?
#Coca-Cola

#Around 1983, the stock for one of these companies (Coca-Cola or Procter and Gamble) was 
#going up, while the other was going down. Which one was going up?
#ProcterGamble

#In the time period shown in the plot, which stock generally has lower values?
#Coca-Cola

#Let's take a look at how the stock prices changed from 1995-2005 for all five companies.
plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(ProcterGamble$Date[301:432],ProcterGamble$StockPrice[301:432],col="blue")
lines(IBM$Date[301:432],IBM$StockPrice[301:432],col="black")
lines(GE$Date[301:432],GE$StockPrice[301:432],col="green")
lines(Boeing$Date[301:432],Boeing$StockPrice[301:432],col="purple")

#Which stock reaches the highest value in the time period 1995-2005?
#IBM

#In October of 1997, there was a global stock market crash that was caused by an economic 
#crisis in Asia. Comparing September 1997 to November 1997, which companies saw a decreasing 
#trend in their stock price?
#CocaCola

#In the last two years of this time period (2004 and 2005) which stock seems to be performing 
#the best, in terms of increasing stock price?
#IBM

#if stocks tend to be higher or lower during certain months. Use the tapply command to 
#calculate the mean stock price of IBM, sorted by months. To sort by months, use
mean(IBM$StockPrice)
tapply(IBM$StockPrice,months(IBM$Date),mean)

#Repeat the tapply function from the previous problem for each of the other four companies, 
#and use the output to answer the remaining questions.
#General Electric and Coca-Cola both have their highest average stock price in the same month. 
#Which month is this?

tapply(GE$StockPrice,months(GE$Date),mean)
tapply(CocaCola$StockPrice,months(CocaCola$Date),mean)

#For the months of December and January, every company's average stock is higher in one month 
#and lower in the other. In which month are the stock prices lower?
#December