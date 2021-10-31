#Load the packages: tidyr, dplyr
library(readxl)
library(tidyr)
library(dplyr)

#Read the excel file and get the dataset of food supply and sugar
food_supply <- read_excel("food_supply_kilocalories_per_person_and_day.xlsx")
sugar <- read_excel("sugar_per_person_g_per_day.xlsx")

#To tidy a dataset, pivot the offending columns into a new pair of variables
tidy_food_supply <- pivot_longer(food_supply, 2:54, names_to = "year", values_to = "food_supply")
tidy_sugar <- pivot_longer(sugar, '1960':'2012', names_to = "year", values_to = "sugar")

#To combine the tidied versions of tidy_sugar and tidy_food_supply into a single tibble, 
#we need to use left_join(), which you’ll learn about in relational data.
tidy_data <- left_join(tidy_food_supply, tidy_sugar)

## comment about left_join: I think it is better to use the parameter "by" in left_join, although if you don't use "by", the original join will be by = c("country","year"))
## tidy_data <- left_join(tidy_food_supply, tidy_sugar, by = c("country","year"))
str(tidy_data)

#Drop tibble's rows containing missing values
tidy_data <- drop_na(tidy_data)

#Mutate adds new variables and preserves existing
#the new variable is percentage which is sugar/food_supply
tidy_data <- mutate(tidy_data, 
                    percentage = sugar/food_supply)


#gather
#tidy_food_supply <- food_supply %>%
#  gather("year", "food", 2:54)
#tidy_food_supply <- gather(food_supply, "year", "food", 2:54)
#tidy_food_supply

