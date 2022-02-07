##########################################
## R Tutorial for Data Analysts
## Christoph Kopp  February 11, 2015


## 1.0 Background   # 1.1 Introduction
# The aim of this tutorial is to help you get started using the R environment
# for scientific data analysis.

# The workflow for data analysis
# Import data
# Check Data
# Describe the Data
# Transform the Data
# Analyse the Data
# Store important results such as graphics or tables as files

## 1.3 Installation
# http://stat.ethz.ch/CRAN

## 1.4 The R window system and GUI

# use RStudio(http://www.rstudio.com/)
# have a look at http://www.sciviews.org/_rgui/

## 1.5 A first R session
# R comes with many data sets already installed. For the purpose of this sample session, 
# we use one of these data sets instead of importing our own data. 
# You may find a list of available data sets by typing data() at the console.
# We use the data set PlantGrowth. To get basic info

?PlantGrowth
PlantGrowth
snip

# Summary information via summary (PlantGrowth)
summary(PlantGrowth)

# the data come from an experiment on plant growth to
# compare yields obtained under a control and two treatment conditions.
# data set is stored in a format called data frame
# which con-tains variables of dierent types.

# have 30 cases (corresponding to rows of the data frame PlantGrowth) 
# and two variables, corresponding to two columns of the data frame.

# The first column contains the weight (dried weight of the
# plants) and is of a type that R calls numeric,

# The second column has the name group and is factor, 
# whose values are called levels in R. The levels are \ctrl", \trt1" and \trt2".

# To get summary information for each level of the group variable, 
# for each treatment) use
by(PlantGrowth, PlantGrowth$group, summary)

# to get a boxplot of weight separately by group, use the comman boxplot
?boxplot
boxplot(weight~group, data = PlantGrowth)

# The plot still lacks some labels, which we add (together with some color for the boxes)
boxplot(weight ~ group, data=PlantGrowth, main="Plant Growth
data", ylab="Dried plant weight", col="cyan")

# perform an analysis of variance use lm(), Our model is pg.lm:

pg.lm <- lm(weight ~ group, data=PlantGrowth)
pg.lm

# To get a bit more information, use summary(pg.lm)
summary(pg.lm)

# To test the signifcance of the group difference,
anova(pg.lm)

# using the plot command #demonstrate methods of plot() function
plot(PlantGrowth)
plot(pg.lm)


#clean up
rm(pg.lm)

#Object creation
y <- c(-4, 0, 2.3, -9)

x <- c("one",1)

# the structure of x using str(x):
str(x)

# To create a character vector, use c()
strings.1 <- c("I", "know how")
strings.2 <- c("to", "make", "strings")

#They may also be combined with c():
c(strings.1,strings.2)

# z is a list with two components, the 1st one being the character vector "one" of length one 
# and the second being the numeric vector 1, also of length one.
z <- list("one",1)

#using mode(pg.lm) shows us that pg.lm has mode list (one usually says that it is a list)
mode(pg.lm)

#with class(pg.lm) we find that it has class lm
pg.lm

#to show the components of lists
str(pg.lm)

# to extract the names of the components of a lists with $ operator
pg.lm$components

#to show the class of lists
class(pg.lm)
names(pg.lm)

# to change the names
# define an object model.2 as a copy of pg.lm, then change the names, display model.2
# and then remove (delete) model.2:
model.2 <- pg.lm
names(model.2$coefficients) <- c("R","is","awesome")
model.2
rm(model.2)

#Obtaining information about objects; try with PlantGrowth
class(PlantGrowth)   		#gives the class of an object,
mode(PlantGrowth)	  		#gives the mode of an object,
attributes(PlantGrowth) 	#retrieves other attributes of an object,
str(PlantGrowth)  		#information on the structure of an object, including mode and attributes.
names(PlantGrowth)
dim(PlantGrowth)
summary(PlantGrowth)

#Handling your workspace
ls()	#lists the content of your workspace
ls.str()	#does the same, provides additional structural information
rm()	#removes an object from your workspace

#Data handling; Missing values (NA)
na.vec <- c(-1,0,1,NA)
mean(na.vec)
(-1+0+1+NA)/4

#To get a logical vector which indicates missingness, use
is.na(na.vec)

#To get the nonmissing indices, use the logical negation operator !
!is.na(na.vec)

#to get the vector which contains only the non-missing values, use
na.vec[!is.na(na.vec)]

# To set some value to missing somebody, use
data[data==999] <- NA

# to remove missing values
na.omit
complete.cases()

#Data frames  # components
str(PlantGrowth)

#Factors the R structure for representing categorical variables
#which take their values in a finite set of categories called the levels of the factor;
#an example is the treatment group of PlantGrowth

#For conversion, use 
data$var <- factor(data$var)
PlantGrowth$treatment <- factor(PlantGrowth$treatment)
as.factor

#Data important
#use read.csv() or read.delim(), both of which the read.table().
data <- read.csv(file="data.csv", header=TRUE, sep=";")

# using the dataframe PlantGrowth
#creates the vector group and then creates a data frame called pg
group <- PlantGrowth$group
pg <- data.frame(grp = group, wt =  weight)
pg

# create dataframe from scratch

pets <- data.frame(
name = c("Milou", "Nathan", "Ebony", "Carl", "Penny"),
kind = c("cat", rep("dog", 2), "Crocodile", "Horse"),
sex = c("F", rep("M", 3), "F"),
size = c("small", "big", "medium", "huge", "huge"),
weight = c(5.2, 80.9, 30.5, 1003, 520))

# to look at the data pets
pets

# structure of the data frame pets
str(pets)

#convert name to character and not factor and check results
pets$name <- as.character(pets$name)
str(pets)

#access the dimensions of the data frame
dim(pets)

#access the names of the variables
names(pets)

#change the names of the variables to weight 
# used the index [5] to access the fifth element of names(pets)
names(pets)[5] <- "weight"

# Data quality and descriptive statistics
summary(pets)
table(PlantGrowth)

#subset selection using index vectors
weight <- PlantGrowth$weight
weight

#to select subsets, using the [] operator
weight[c(1,16)]

#select first five elements,
weight[c(1,2,3,4,5)] 
#or the equivalent but much more convenient 
weight[c(1:5)]
weight[1:5]

#using names
animals.weight <- c(Milou = 80.2, Nathan = 80.9, Ebony = 30.5)
animals.weight[c("Nathan","Milou")]

#replacing values by subsetting
z <- c(0,2,2,0)
z[c(1,4)] <- c(2,2)
z
[1] 2 2 2 2 

#Using logical vectors
weight[weight > 5]
#Using which()
which(names(pets)=="weigth")

#to change the names vector using
names(pets)[which(names(pets)=="weigth")] <- "weight"

#Subset selection for data frames Using index vectors
#two dimensions,the rows (First coordinate) and the columns (second coordinate).
PlantGrowth[c(1,3:5),1:2]

#for all the rows (or columns), we just type nothing:
PlantGrowth[c(1,3:5),]

#Column selection using names
#Selection by [] produces a data frame
pets["kind"]
pets[c("weight","kind")]

#Selection by [[]] produces a vector, not a data frame
pets[["kind"]]

#Selection by $ gives a vector
pets$kind
pets[["kind"]]

#use matrix-style subscripting with names (i. e. use [,])
pets[,c("weight","kind")]  #selects the two columns,gives back a data frame
pets[,"kind"] 	#gives back a vector
pets[,"kind", drop=FALSE] 	#to avoid getting a vector when choosing one column
pets["kind"]	#to get a data frame with one variable

#logical vectors
PlantGrowth[c(TRUE,FALSE)]   #selects only the first column

#select data frame from the control group, called ctrl
PlantGrowth[PlantGrowth$group=="ctrl",]
PlantGrowth$group=="ctrl"
PlantGrowth[PlantGrowth[["group"]]=="ctrl",]

#to select from PlantGrowth the subset with weight between 4 and 5, from
#the treatment groups only
PlantGrowth[(PlantGrowth$weight>=4) & (PlantGrowth$weight<=5) &
(PlantGrowth$group %in% c("trt1","trt2")),]

#Subset selection using subset()
subset(PlantGrowth, group == "ctrl")

#Subset selection for higher dimensions
# A three-dimensional array may be obtained for example with
A <- array(1:24, c(3,4,2))
A  			#rows=3 first then columns=4,then sheets=2

#to select the first sheet
A[,,1]

#to extract the second value of the firstcolumn in the PlantGrowth data frame
PlantGrowth[2,1]
PlantGrowth[[1]][2]
PlantGrowth[[c(1,2)]]
PlantGrowth[1][2,1]
PlantGrowth[1][2]		#will not work

#use str to find answers
str(PlantGrowth)
#epxlain
PlantGrowth[1][1][1][1][1][1]

#Function  mean
mean(c(-1,0,1,NA))	#default settings for mean() are not to trim and not to remove NA

#the mean of the valid observations of a vector
mean(na.vec[!is.na(na.vec)])
#Or simply use na.rm=TRUE in mean()
mean(na.vec, na.rm=TRUE)

#to define a function
sem <- function(x) sd(x)/sqrt(length(x))
sem(c(9,-9,0,0,1))
sem(PlantGrowth$weight[PlantGrowth$group=="ctrl"])


#the sem function does not handle NA values
sem.valid <- function(x) sqrt(var(x,na.rm=TRUE)/length(na.omit(x)))

#apply and friends  apply functuons to subgroups
# use iris data set which contains the sepal length, sepal width, petal length and petal width 
# for 50 plants of each of the three species Iris setosa, I. versicolor and I. virginica.

# mean of each numeric variable using apply() fun, The syntax is
apply(X, MARGIN, FUN, ...)
apply(iris[,1:4],2,mean)

iris.num <- iris[sapply(iris, is.numeric)]
apply(iris.num, 2, mean)

#is.numeric will give back TRUE for numeric var and FALSE for other vars
lapply(iris,is.numeric)
iris$Sepal.Length
iris$Sepal.Width
iris$Petal.Length
iris$Petal.Width
iris$Species

#Calling sapply(iris, is.numeric) in contrast will give back a vector instead of a list
sapply(iris, is.numeric)

#sepal length means for each
#species separately, we may use the tapply function with syntax
tapply(X, INDEX, FUN = NULL, ..., simplify = TRUE)
tapply(iris$Sepal.Length, iris$Species, mean)
with(iris, by(Sepal.Length, Species, mean))

#to get the means for all the numeric variables by groups use aggregate()
aggregate(iris.num, list(iris$Species), mean)
#by formula
aggregate(. ~ Species, iris, mean)

#Descriptive statistics
summary(iris)
#useful functions
#mean(), median(), quantile(), sd()
#Use table() for tabulation (also cross-tabulation)
table(iris$Species)

#Character manipulation
#Extracting substrings and manipulating character vectors using 
#substr(), cat(), paste(), parse(), deparse()

#Handling statistical models lm(), the function to fit linear models
data.lm <- lm(formula, data, ...)
pg.lm <- lm(weight ~ group, data=PlantGrowth)
#extracting cofficients or residuals;
#print(), summary(), plot(), residuals()

#Packages
library(packages)		#to load
search()		#To see which libraries are loaded

#To detach the car
detach(package:car)