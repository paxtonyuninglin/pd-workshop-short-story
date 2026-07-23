# 1. useful keyboard shortcuts --------------------------------------------------------

# command/ctrl+enter -> runs highlighted code or current line
# shift+command/ctrl+C -> make a line a comment
# shift+command/ctrl+M -> make a pipe
# option/alt+- makes this '<-' incredibly useful symbol
# shift+command/ctrl+A -> this realigns code automatically (adds spaces, idents, etc.) 
# shift+command/ctrl+R -> create section
# ctrl/command+alt/option+R -> run entire script
# holding down option/alt allows you to select multiple lines/blocks of code/text at once

# 2. basic R commands --------------------------------------------------------

# one of the most basic commands in R is assigning objects values using the "<-" symbol. it works like this: objectname <- an_existing_object_or_datafile_or_value. now 'objectname' is equivalent to whatever was on the right side of the arrow. for example run the following:
test <- 2+2
# now run:
test

# c() is a way of assigning multiple items to a name. Run the following:
numbers <- c(1,2,3,4,5)
numbers

names <- c("Amy","Mackenzie","Takuji")
names

# $ is a tool for grabbing (indexing) columns in a dataframe
data$voidtype
data$burrow
max(data$burrow)
min(data$burrow)
mean(data$burrow)

# you can also use [] and numbers to grab columns in a dataframe
data[1,] # grab row 1
data[-1,] # everything but row 1
data[,6] # grab column 6
data[2,9] # grab row 2 of column 9
data[c(1:3),] # grab rows 1 to 3 (note the uses of ":" and "c")
data[-c(1:3),] # grab everything but rows 1 to 3
data[c(1:3),c(1:2)] # grab rows 1:3 of columns 1:2

# in the tidyverse, this can be done using the function select() for columns and rowwsie() for rows