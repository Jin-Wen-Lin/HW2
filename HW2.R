### Jin Wen Lin ###

### Homework 2                                         ###
### GGPlot Basics ###

#Put your code in this file. Make sure you assign the relevant values to the correct variable names, which are given below. 
#Uncomment the variables as you assign your final values/functions/results to them.

library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(stringr)# This loads the packages necessary to run your plots. Do not delete or comment this out.

### Exercise 1

library(tidyverse)
spx_1Month <- read_csv("SPX-1Month.csv")

spx_plot1<- ggplot(spx_1Month, mapping=aes(Date, `Close/Last`)) + 
  geom_point() + geom_line(aes(group = 1))

spx_plot2<- spx_plot1 + 
  labs(x = "Date", y = "Price", 
       title = "S&P500 − Closing Price over the Last Month") + 
  theme(axis.text.x=element_text(angle=45,hjust=1)) 

### Exercise 2

bookGenres <- read_csv("BookGenres.csv")  
bookplot<- ggplot(
  bookGenres,
  mapping = aes(Category, Price,
                color = Season)) +
  geom_point(alpha = 0.4) + 
  labs(x = "Genre", y = "Price ($)", 
       title = "The Price of Fiction Books by Genre and Season") + theme_minimal() + 
  theme(axis.text.x=element_text(angle=30,hjust=1))
  
### Exercise 3

squirrel <- read_csv("squirrel.csv")  
squirrelPlot<- ggplot(squirrel, 
                      mapping = aes(Activities, fill = Interactions.with.Humans)) + 
  geom_bar(position = "dodge") + 
  labs(x = "Squirrel's Activity during Observation", 
       title = "Squirrel Behavior in NYC Parks", fill = "Interactions with Humans")
  
### Exercise 4

big_mac <- read_csv("big_mac.csv")  
str(big_mac)
gdp<- as.numeric(big_mac$GDP.Per.Capita)

bigMac<- ggplot(big_mac, aes(gdp, dollar_price)) + 
  geom_point() + geom_smooth() + 
  labs(title = "Countries' GDP Per Capita compared to their Big Mac Index", 
       x = "GDP Per Capita in Dollars", y = "Dollar Price of a Big Mac")

logBigMac<- ggplot(big_mac, aes(log(gdp), dollar_price)) + 
  geom_point() + geom_smooth() + 
  labs(title = "Countries' GDP Per Capita compared to their Big Mac Index", 
       x = "log GDP Per Capita in Dollars", y = " Dollar Price of a Big Mac")
  