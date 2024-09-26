data("airquality")
View(airquality)
sub_data <- subset(airquality, Temp > 80 & Month > 5 | Ozone <40)[1:5,]
sub_data

x <- c(2.1, 4.2, 3.3, 5.4)
x[c(3, 1)]
x[order(x)]

#duplicated indices yield duplicated values
x[c(1, 1)]

# Real numbers are silently truncated to integers
x[c(2.1, 2.9)]

## Data Structures

## first order of business - load the library/ies you need
## if you don't have it install it - install.packages
## for example - things that i need today include
library(readr)
library(stringr)
library(tidyverse)
library(data.table)

# R's base data structures can be organized by their dimensionality (1d, 2d, or nd) 

# Homogenous - 1d Atomic vector; 2d Matrix; nd Array (x,y) (1,1)[1,1]
# Heterogenous - 1d List; 2d Data frame

# The basic data structure in R is the vector
vector1 <- matrix(1:6, ncol = 3, nrow = 2)
vector1

# 2d matrix - (row 1, column 2)

matx2d <- matrix(C<-(1:10),nrow=5, ncol=6)
matx2d

a_matx1 <- apply(matx2d, 1, sum) #sums of rows
a_matx1

# YOUR TURN - Add the columns
a_matx2 <- apply() #sums of column
a_matx2


# Atomic vectors

dbl_var <- c(1, 2.5, 4.5)
dbl_var

# With the L suffix, you get an integer rather than a double
int_var <- c(1L, 6L, 10L)
int_var

# Use TRUE and FALSE (or T and F) to create logical vectors
log_var <- c(TRUE, FALSE, T, F)
log_var

x = 12
y = 10

x < y
# Types and tests #
# Given a vector, you can determine its type with typeof(), 
# or check if it's a specific type with an "is" function: 
# is.character(), is.double(), is.integer(), is.logical(), or, more generally, is.atomic()

int_var <- c(1L, 6L, 10L)
typeof(int_var)

is.integer(int_var)
is.atomic(int_var)


dbl_var <- c(1, 2.5, 4.5)

typeof(dbl_var)

is.double(dbl_var)

is.atomic(dbl_var)


# Lists - Lists are different from atomic vectors because their elements 
# can be of any type, including lists. You construct lists by using list() 
# instead of c()

x_list <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9))
str(x_list)

# Factors --- A factor is a vector that can contain only predefined values, 
# and is used to store categorical data

months = c("March","April","January","November","January",
           "September","October","September","November","August",
           "January","November","November","February","May","August",
           "July","December","August","August","September","November",
           "February","April")

months = factor(months)
table(months)
levels(months)

# random numbers
?runif
random_numbers <- runif(25)
random_numbers
min(random_numbers)
max(random_numbers)
round(random_numbers)
ceiling(random_numbers)
floor(random_numbers)
round(random_numbers, digits = 2)


### YOUR TURN - generate 100 random DU ID numbers 
# from 870000000 to 899999999

# 1. data frame - for tabular data - columns are vectors -with
# same length - and single data type
?readr
?data.frame
?read.csv
?read_csv
?fread
?tibble

# Example
tibble(x = 1:5, y = x ^ 2)

# How the length of one is recycled - the length
# different from one determines the number of rows

tibble(a = 1, b = 1:3)

tibble(a = 1:3, b = 1)


## data.table - a more enhanced version of data table
##

# https://raw.githubusercontent.com/Rdatatable/data.table/master/vignettes/flights14.csv
# how can we READ this data using base read.csv | read_csv | fread
# and let's compare the performance of read time for each
url <- "https://raw.githubusercontent.com/Rdatatable/data.table/master/vignettes/flights14.csv"
fly <- read.csv(url)
View(fly)
## OR, Let's download the file to our working directory

download.file("https://raw.githubusercontent.com/Rdatatable/data.table/master/vignettes/flights14.csv", "flights14.csv")

system.time(url1 <- read.csv("flights14.csv"))
system.time(url2 <- read_csv("flights14.csv"))
system.time(url3 <- fread("flights14.csv"))

flights <- read.csv("flights14.csv")

flights2 <- fread("flights14.csv")

# and check the STRucture, DIMension, number of rows, number of columns
# column names, rownames, no of rows, no of columns, head, tail, summary of
dim(fly)
typeof(fly)
View(fly)
# The most basic variable in R is a vector. 
# An R vector is a sequence of values of the same type. 

# All basic operations in R act on vectors 
# (think of the element-wise arithmetic, # for example). 
# The basic types in R are as follows.

# numeric		Numeric data (approximations of the real numbers,R)

dbl_var <- c(1,2,5.3,6,-2,4)
typeof(dbl_var) #check whether a vector is made up of integer or double value

# double - for double precision

# integer		Integer data (whole numbers,Z) placing an L after the values creates a string of integers
int_var <- c(1L,2L,3L,6L,4L)
typeof(int_var) # check whether a vector is made up of integer or double value

int_var <- c(1,2,3,6,4)
typeof(int_var)

# Converting between integer and double values
# By default, if you read in data that has no decimal points
as.double(int_var) # converts integers to double-precision values
as.numeric(int_var) # identical to as.double()
as.integer(dbl_var) # converts doubles to integers
typeof(dbl_var)


# factor		-Categorical data (simple classifications, like gender)

fact_var <- c("TX","MD","AZ","TX","CO","CO")
as.factor(fact_var)

# ordered		-Ordinal data (ordered classifications, like educational level) 
temp_vector <- c("High", "Low", "High", "Low", "Medium")

# Specify that they are ordinal variables with the given levels
f_temp_vector <- factor(temp_vector, order = TRUE, 
                      levels = c("Low", "Medium", "High"))

# Print the result 
f_temp_vector

# character	-Character data (strings) 
stud_name <- c("SOPHEARATH","STEVIE","LINDSAY","ANNE")
l_stud_name <-lapply(stud_name, tolower)
str(l_stud_name)
?lapply
example("lapply")
## - YOUR TURN - show how you can copy the example statements
## for the lapply function - and explain the results of the following:
#### x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
#### lapply(x, mean)


# sapply() function takes list, vector or data frame as input and returns a vector or matrix
data("cars")
View(cars)
data1 <- cars
lmn_cars <- lapply(data1, min)
smn_cars <- sapply(data1, min)
lmn_cars
smn_cars

# YOUR TURN - view the data first and get the maximum speed and stopping distances of cars
smn_cars <- sapply(data1, max)
smn_cars


## You may need to Install the tidyverse package for the following task
## install.packages("tidyverse") - IF YOU HAVE NOT INSTALLED THE PACKAGE

# Download files from the Internet -using the function download.file()
# into /data subdirectory -under current working directory 
download.file("https://ndownloader.figshare.com/files/2292169", "portal_data_joined.csv")

getwd()
# load the data to R using read.csv - as an object of data.frame
surveys <- read.csv("data/portal_data_joined2.csv")

# C:/Users/shimelis.assefa/Documents/DataVis/data/portal_data_joined2.csv

View(surveys)
# Use head() to view the first 6 rows.
head(surveys)

# Use tail() to view the last 6 rows.
tail(surveys)

# Use head() to view the data all of it
View(surveys)


# Use str() to look at the structure of the data.
str(surveys)
?dim

## YOUR TURN ##
# USE help to answer the folloiwng of the - surveys - data
# to further inspect the data.frame object - surveys


# return a vector with the number of rows in the first element, and the number of columns as the second element 
# (no_of_obs, No_of_Col)
dim(surveys)

# return the number of rows
nrow(surveys)

# return the number of columns
ncol(surveys)

# return the column names
names(surveys)
colnames(surveys)

# return the row names
rownames(surveys)

# return summary statistics for each column
summary(surveys)

# stringsAsFactors - The default when reading in data with read.csv(), 
# columns with text get turned into factors.
# You can avoid this with the argument stringsAsFactors=FALSE
# and now see the structure of surveys2
surveys2 <- read.csv("data/portal_data_joined.csv", stringsAsFactors = FALSE)
str(surveys2)

surveys2 <- read.csv("data/portal_data_joined.csv", stringsAsFactors = TRUE)
str(surveys2)

## Convert the column "plot_type" into a factor

surveys2$plot_type <- factor(surveys2$plot_type)

# Indexing, Sequences, and Subsetting
# With coordinates - Row numbers come first, followed by column numbers

surveys[1,1] # get the element in the 1st row, 1st column as a vector
surveys[2,7] # get the element in the 2nd row, 7th column as a vector
surveys[7,] # get the entire 7th row, leave the column part blank as a data.frame
surveys[,7] # get the entire 7th column, leave the row part blank as a vector
surveys[7] # get the 7th column of the data frame as a data.frame
surveys[1:3, 7] # first 3 elements in the 7th column as a vector

surveys[, -1] #  The whole data frame, except the first column
surveys[-c(7:34786), ] # Equivalent to head(surveys)


## YOUR TURN ##
# Create data.frame manually using the following information
# the name of the object class_roster
# elements - stud_fname, stud_lname, stud_program, group_no, stud_state
# stud_fname - "Sophearath", "Stevie", "Lindsay", "Anne", "Raymond",
# "Euginia", "Alec", "Maggie", "Casey", "Denise", "Emilie", "Jennifer",
# "Damon"
# stud_lname - "Chea", "Gunter", "Gypin", "Holland", "Kelley", "Liapich",
# "Millman", "Ryan", "Short", "Trice", "Villegas", "Vine"
# stud_program - "RMS", "LIS", "RDM", "RMS", "LIS", "RDM", "LIS", "LIS",
# "LIS", "RDM", "EDP", "LIS", "RMS" 
# group_no - 1, 2, 2, 1, 3, 3, 2, 1, 4, 1, 4, 3, 4
# stud_state (fictional) - "CO", "CO", "NY", "CA", "CA", "TX", "CA",
# "CO", "CO", "NY", "NY", "IL", "GA"
## more instruction- after creating the data frame - convert the first and last name variables 
## to character from factor - and convert the group_no to factor from number

class_roster <- data.frame(stud_fname=c("Sophearath", "Stevie", "Lindsay", "Anne", "Raymond", "Euginia", "Alec", "Maggie", "Casey", "Denise", "Emilie", "Jennifer",
                                       "Damon"),
                           stud_lname=c("Chea", "Gunter", "Gypin", "Holland", "Kelley", "Liapich", "Millman", "Ryan", "Short", "Solis", "Trice", "Villegas", "Vine"),
                            stud_program=c("RMS", "LIS", "RDM", "RMS", "LIS", 
                                           "RDM", "LIS", "LIS", "LIS", "RDM", 
                                           "EDP", "LIS", "RMS"),
                            stud_state=c("CO", "CO", "NY", "CA", "CA", "TX", "CA",
                                         "CO", "CO", "NY", "NY", "IL", "GA"),
                            group_no=c(1, 2, 2, 1, 3, 3, 2, 1, 4, 1, 4, 3, 4)
                            )



str(class_roster3)
View(class_roster3)
# NA North America
class_roster3$stud_fname <- as.character(class_roster3$stud_fname)
class_roster3$stud_lname <- as.character(class_roster3$stud_lname)
class_roster3$group_no <-as.factor(class_roster3$group_no)

     
data.frame(class_roster)


## DATA TRANSFORMATION - using flights14 data - ps. fread to flights2

## Q1 - Get all the flights with "JFK" as the origin airport in the 
# month of June.

View(flights2)
Q1 <- flights2[origin == "JFK" & month == 6L]
Q1

## Q2 - Get the first two rows from flights

## Q3 - Sort flights first by column origin in ascending order, 
## and then by dest in descending order:


## Q4 - Select arr_delay column, but return it as a vector

## Q5 - Select arr_delay column, but return it as a data.table

## Q6 - Select both arr_delay and dep_delay columns

## Q7 - Select both arr_delay and dep_delay columns and 
## rename them to delay_arr and delay_dep

### HOMEWORK - can you create a data from out of the following data and assign it to a variable called
## d_frame
## ID = c("b","b","b","a","a","c"),
## a = 1:6,
## b = 7:12,
## c = 13:18