#load the package tidyverse and ggplot2
library(tidyverse)
library(ggplot2)

#Read R Code from the file "wrangling_code.R"
source(file = "wrangling_code.R", echo = TRUE)

#ggplot function to make the visualization, I set there arguments in this function.
#The three arguments are two countries I select to compare and the variable I want to compare.
compare_plot <- function (country1, country2, indicator) {
  
  #Use if - else to do with different variables
 if(indicator == 'food_supply') {
   
   #filter() allows you to subset observations based on their values. 
   #The first argument is the name of the data frame. 
   #The second and subsequent arguments are the expressions that filter the data frame. 
   #we set two subgroups by the country
   
  tidy_country1 <- filter(tidy_data, country == country1)
  tidy_country2 <- filter(tidy_data, country == country2)
  
  #convert the year to numeric so that it could be continuous 
  tidy_country1$year <- as.numeric(tidy_country1$year)
  tidy_country2$year <- as.numeric(tidy_country2$year)
  
  #ggplot the graph between the food_supply and year
  ggplot()+
    geom_path(data = tidy_country1, aes(x = year, y = food_supply), group = 1, color = "purple", lwd = 1)+
    geom_path(data = tidy_country2, aes(x = year, y = food_supply), group = 1, color = "orange", lwd =1)
  
} else if(indicator == 'sugar') {
  tidy_country1 <- filter(tidy_data, country == country1)
  tidy_country2 <- filter(tidy_data, country == country2)
  tidy_country1$year <- as.numeric(tidy_country1$year)
  tidy_country2$year <- as.numeric(tidy_country2$year)
  ggplot()+
    geom_path(data = tidy_country1, aes(x = year, y = sugar),  color = "purple", lwd = 1)+
    geom_path(data = tidy_country2, aes(x = year, y = sugar),  color = "orange", lwd =1)
  
} else if (indicator == 'percentage') {
  tidy_country1 <- filter(tidy_data, country == country1)
  tidy_country2 <- filter(tidy_data, country == country2)
  tidy_country1$year <- as.numeric(tidy_country1$year)
  tidy_country2$year <- as.numeric(tidy_country2$year)
  ggplot()+
    geom_path(data = tidy_country1, aes(x = year, y = percentage), group = 1, color = "purple", lwd = 1)+
    geom_path(data = tidy_country2, aes(x = year, y = percentage), group = 1, color = "orange", lwd =1)
  
} else stop('warning: Check the indicator!!!!')
}

#input the variable and use the function to get the plot
compare_plot("Solomon Islands", "Thailand",'sugar')
compare_plot("Solomon Islands", "Thailand",'food_supply')
compare_plot("Solomon Islands", "Thailand",'percentage')
