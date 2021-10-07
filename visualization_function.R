library(tidyverse)
library(ggplot2)

source(file = "wrangling_code.R", echo = TRUE)

compare_plot <- function (country1, country2, indicator) {
  # country1 <- 'India'
  # country2 <- 'Japan'
  # indicator <-  'food_supply'
  # indicator <- as.character(indicator)
 if(indicator == 'food_supply') {
  tidy_country1 <- filter(tidy_data, country == country1)
  tidy_country2 <- filter(tidy_data, country == country2)
  tidy_country1$year <- as.numeric(tidy_country1$year)
  tidy_country2$year <- as.numeric(tidy_country2$year)
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

