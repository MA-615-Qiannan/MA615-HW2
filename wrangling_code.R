library(readxl)
library(tidyr)
library(dplyr)

food_supply <- read_excel("food_supply_kilocalories_per_person_and_day.xlsx")
sugar <- read_excel("sugar_per_person_g_per_day.xlsx")

#pivot_longer
tidy_food_supply <- pivot_longer(food_supply, 2:54, names_to = "year", values_to = "food_supply")
tidy_sugar <- pivot_longer(sugar, '1960':'2012', names_to = "year", values_to = "sugar")
tidy_data <- left_join(tidy_food_supply, tidy_sugar)
str(tidy_data)
tidy_data <- drop_na(tidy_data)
tidy_data <- mutate(tidy_data, 
                    percentage = sugar/food_supply)

tidy_Solomon_Islands <- filter(tidy_data, country == "Solomon Islands")
tidy_Thailand <- filter(tidy_data, country == "Thailand")

#gather
#tidy_food_supply <- food_supply %>%
#  gather("year", "food", 2:54)
#tidy_food_supply <- gather(food_supply, "year", "food", 2:54)
#tidy_food_supply

