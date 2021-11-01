#load the package tidyverse and ggplot2
library(tidyverse)
library(ggplot2)

#Read R Code from the file "wrangling_code.R"
source(file = "wrangling_code.R", echo = TRUE)

#ggplot function to make the visualization, I set there arguments in this function.
#The three arguments are two countries I select to compare and the variable I want to compare.
compare_plot <- function (country1, country2, indicator) {
 
  ## revised : extract the country we need by using logic expectation and make them into one DataFrame;
  ## Now you do not need to extract the data seperatly in every if-else part
 tidy_country <- tidy_data %>% filter(country == country1 | country == country2)
  #Use if - else to do with different variables
 if(indicator == "food_supply") {
   
   #filter() allows you to subset observations based on their values. 
   #The first argument is the name of the data frame. 
   #The second and subsequent arguments are the expressions that filter the data frame. 
   #we set two subgroups by the country
   
   ## revised : extract the country we need by using logic expectation and make them into one DataFrame
  # tidy_country1 <- filter(tidy_data, country == country1)
  # tidy_country2 <- filter(tidy_data, country == country2)
  ## tidy_country_1 <- tidy_country %>% select(country, year, all_of(indicator))
  ## tidy_country_1$year <- as.numeric(tidy_country_1$year)
  
  #convert the year to numeric so that it could be continuous 
  # tidy_country1$year <- as.numeric(tidy_country1$year)
  # tidy_country2$year <- as.numeric(tidy_country2$year)
  
  #ggplot the graph between the food_supply and year
  ## revised: added the geom_point to make the data of each year visible
  ## added: added legend to clarify which line represent the corresponding country
  ggplot(data = tidy_country) +
    geom_path(mapping = aes(x = as.numeric(year), y = food_supply, color = country)) +
    geom_point(mapping = aes(x = as.numeric(year), y = food_supply, color = country)) +
    labs(x = "year", y = indicator)
  
} else if(indicator == 'sugar') {
  # tidy_country1 <- filter(tidy_data, country == country1)
  # tidy_country2 <- filter(tidy_data, country == country2)
  # tidy_country1$year <- as.numeric(tidy_country1$year)
  # tidy_country2$year <- as.numeric(tidy_country2$year)
  ## revised: added the geom_point to make the data of each year visible
  ## added: added legend to clarify which line represent the corresponding country
  ggplot(data = tidy_country) +
    geom_path(mapping = aes(x = as.numeric(year), y = sugar, color = country)) +
    geom_point(mapping = aes(x = as.numeric(year), y = sugar, color = country)) +
    labs(x = "year", y = indicator)
  
  
} else if (indicator == 'percentage') {
  # tidy_country1 <- filter(tidy_data, country == country1)
  # tidy_country2 <- filter(tidy_data, country == country2)
  # tidy_country1$year <- as.numeric(tidy_country1$year)
  # tidy_country2$year <- as.numeric(tidy_country2$year)
  ## revised: added the geom_point to make the data of each year visible
  ## added: added legend to clarify which line represent the corresponding country
  ggplot(data = tidy_country) +
    geom_path(mapping = aes(x = as.numeric(year), y = percentage, color = country)) +
    geom_point(mapping = aes(x = as.numeric(year), y = percentage, color = country)) +
    labs(x = "year", y = indicator)
  
  
}else stop('warning: Check the indicator!!!!')
}

#input the variable and use the function to get the plot
compare_plot("Solomon Islands", "Thailand",'sugar')
compare_plot("Solomon Islands", "Thailand","food_supply")
compare_plot("Solomon Islands", "Thailand",'percentage')


compare_plot_1 <- function (country1, country2, indicator) {
  
  ## use another plot: compare the plot of scatter and the linear regression of 2 countries
  ## revised : extract the country we need by using logic expectation and make them into one DataFrame;
  ## Now you do not need to extract the data seperatly in every if-else part
  tidy_country <- tidy_data %>% filter(country == country1 | country == country2)
  #Use if - else to do with different variables
  if(indicator == "food_supply") {
    
    #filter() allows you to subset observations based on their values. 
    #The first argument is the name of the data frame. 
    #The second and subsequent arguments are the expressions that filter the data frame. 
    #we set two subgroups by the country
    
    ## revised : extract the country we need by using logic expectation and make them into one DataFrame
    
    #ggplot the graph between the food_supply and year
    ## revised: added the geom_point to make the data of each year visible
    ## added: added legend to clarify which line represent the corresponding country
    ggplot(data = tidy_country) +
      geom_smooth(mapping = aes(x = as.numeric(year), y = food_supply, color = country), formula = y~x, method = "glm") +
      geom_point(mapping = aes(x = as.numeric(year), y = food_supply, color = country)) +
      labs(x = "year", y = indicator)
    
  } else if(indicator == 'sugar') {
    ## revised: added the geom_point to make the data of each year visible
    ## added: added legend to clarify which line represent the corresponding country
    ggplot(data = tidy_country) +
      geom_smooth(mapping = aes(x = as.numeric(year), y = sugar, color = country), formula = y~x, method = "glm") +
      geom_point(mapping = aes(x = as.numeric(year), y = sugar, color = country)) +
      labs(x = "year", y = indicator)
    
    
  } else if (indicator == 'percentage') {
    ## revised: added the geom_point to make the data of each year visible
    ## added: added legend to clarify which line represent the corresponding country
    ggplot(data = tidy_country) +
      geom_smooth(mapping = aes(x = as.numeric(year), y = percentage, color = country), formula = y~x, method = "glm") +
      geom_point(mapping = aes(x = as.numeric(year), y = percentage, color = country)) +
      labs(x = "year", y = indicator)
    
    
  }else stop('warning: Check the indicator!!!!')
}

#input the variable and use the function to get the plot
compare_plot_1("Solomon Islands", "Thailand",'sugar')
compare_plot_1("Solomon Islands", "Thailand","food_supply")
compare_plot_1("Solomon Islands", "Thailand",'percentage')
