install.packages("tidyverse")
library(tidyverse)

# load data
leafdata <- read.csv("./leaf-length-wide.csv")
View(leafdata)

# pivot long
leaflengthlong <- pivot_longer(leafdata, !measure.ID, names_to = "species", values_to = "leaf.length", values_drop_na = TRUE)

# pivot wide
wide_leaf_data <- pivot_wider(leaflengthlong, names_from = "species", values_from = "leaf.length")

# let's see which row in the dataset CAMROT.1 appears (which is a handy subsetting function from base R, not tidyverse)
which(leaflengthlong$species == "CAMROT.1") # row 46

# lets grab row 49 from the species column by using [which()]
leaflengthlong$species[which(leaflengthlong$species == "CAMROT.1")]

# let's replace this row entry with the correct name "CAMROT"
leaflengthlong$species[which(leaflengthlong$species == "CAMROT.1")] <- "CAMROT"
table(leaflengthlong$species)

# to group data by a certain category, it's useful to use "group_by". let's count the number of observations for which worms are present vs absent, by species
leaflengthlong %>% 
  group_by(species) %>%
  count(worm)

# we can use group_by in conjunction with summarise to get summary stats by group
leaflengthlong %>%
  group_by(species) %>%
  summarise(avg.biomass = mean(shoot.biomass),
            max.biomass = max(shoot.biomass))

###### Question 18: how would you get the standard deviation and median of leaf.length by species? hint: use sd() and median()

###### Question 19: how would you calculate the above summary stats, grouping by both species and worms? hint: use a comma to separate the two groups

# we can also filter out certain values or categories
leaflengthlong %>%
  filter(worm=="worms.present")

leaflengthlong %>%
  filter(!worm=="worms.present") # putting a ! in front includes everything but "worms.present"

leaflengthlong %>%
  filter(shoot.biomass < 2) # numerical conditions can be filtered also, using <, >, >=, <=, and == 

leaflengthlong %>%
  filter(is.na(root.biomass)) # search for missing values in root biomass:
###### Question 20: how many missing values are there? ######

leaflengthlong %>%
  filter(!worm=="worms.present", 
         species == "ACHMIL") # filtering for multiple conditions

# we can customize any of the above according to what we want
leaflengthlong %>%
  filter(!worm=="worms.present") %>%
  group_by(species) %>%
  summarize(mean.shoot.biomass = mean(shoot.biomass))

# Advanced tidy-code: Piping "%>%" -----------------------------------------------------

## 4.1 piping is a coding style that allows you to write and run the code faster and more efficiently. we've alreday  introduced some of it above.

# the usual coding syntax (grammer) is as follows: Verb(Subject,Complement). for example:
select(data, species)

# in piping, the syntax is as follows: Subject %>% Verb(Complement). for example:
data %>% select(species)

# here's another example:
white_and_yolk <- crack(egg, add_seasoning)
omelette_batter <- beat(white_and_yolk)

# turns to:
egg %>% 
  crack(add_seasoning) %>%
  beat() -> omelette_batter # pipe code

# you can see that piping allows you to skip saving intermediate objects (white_and_yolk)

###### Question 22: turn the following pseudo-code into pipes:
omelette_batter <- beat(white_and_yolk)
omelette_with_chives <- cook(omelette_batter, add_chives) ######