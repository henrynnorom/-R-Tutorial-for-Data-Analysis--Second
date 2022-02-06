# -R-Tutorial-for-Data-Analysis--Second
?PlantGrowth
PlantGrowth
summary(PlantGrowth)
by(PlantGrowth, PlantGrowth$group, summary)
boxplot(weight~group, data = PlantGrowth)
boxplot(weight ~ group, data=PlantGrowth, main="Plant Growth
data", ylab="Dried plant weight", col="cyan")
pg.lm <- lm(weight ~ group, data=PlantGrowth)
pg.lm
summary(pg.lm)
anova(pg.lm)
plot(PlantGrowth)
plot(pg.lm)
rm(pg.lm)

#Object creation
y <- c(-4, 0, 2.3, -9)
x <- c("one",1)
str(x)
strings.1 <- c("I", "know how")
strings.2 <- c("to", "make", "strings")
c(strings.1,strings.2)
modepg.lm
pg.lm
str(pg.lm)
pg.lm$components
class(pg.lm)
names(pg.lm)
model.2 <- pg.lm
names(model.2$coefficients) <- c("R","is","awesome")
model.2
rm(model.2)
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
is.na(na.vec)
!is.na(na.vec)
na.vec[!is.na(na.vec)]
data[data==999] <- NA
na.omit
complete.cases()

#Data frames  # components
str(PlantGrowth)
data$var <- factor(data$var)
PlantGrowth$treatment <- factor(PlantGrowth$treatment)
as.factor
#use read.csv() or read.delim(), both of which the read.table().
data <- read.csv(file="data.csv", header=TRUE, sep=";")
#creates the vector group and then creates a data frame called pg
group <- PlantGrowth$group
pg <- data.frame(grp = group, wt =  weight)
pg
pets < - data.frame(
name = c("Milou", "Nathan", "Ebony", "Carl", "Penny"),
kind = c("cat", rep("dog", 2), "Crocodile", "Horse"),
sex = c("F", rep("M", 3), "F"),
size = c("small", "big", "medium", "huge", "huge"),
weight = c(5.2, 80.9, 30.5, 1003, 520)
pets
str(pets)
pets$name <- as.character(pets$name)
str(pets)
dim(pets)
names(pets)
# used the index [5] to access the fifth element of names(pets)
names(pets)[5] <- "weight"
summary()
table()
weight <- PlantGrowth$weight
weight
weight[c(1,16)]
weight[c(1,2,3,4,5)] 
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
weight[weight > 5]
which(names(pets)=="weigth")
names(pets)[which(names(pets)=="weigth")] <- "weight"
PlantGrowth[c(1,3:5),1:2]
PlantGrowth[c(1,3:5),]
pets["kind"]
pets[c("weight","kind")]
pets[["kind"]]
pets$kind
pets[["kind"]]

#use matrix-style subscripting with names (i. e. use [,])
pets[,c("weight","kind")]  #selects the two columns,gives back a data frame
pets[,"kind"] 	#gives back a vector
pets[,"kind", drop=FALSE] 	#to avoid getting a vector when choosing one column
pets["kind"]	#to get a data frame with one variable
PlantGrowth[c(TRUE,FALSE)]   #selects only the first column
PlantGrowth[PlantGrowth$group=="ctrl",]
PlantGrowth$group=="ctrl"
PlantGrowth[PlantGrowth[["group"]]=="ctrl",]
PlantGrowth[(PlantGrowth$weight>=4) & (PlantGrowth$weight<=5) &
(PlantGrowth$group %in% c("trt1","trt2")),]
subset(PlantGrowth, group == "ctrl")

#Subset selection for higher dimensions
# A three-dimensional array may be obtained for example with
A <- array(1:24, c(3,4,2))
A  			#rows=3 first then columns=4,then sheets=2

#to select the first sheet
A[,,1]
PlantGrowth[2,1]
PlantGrowth[[1]][2]
PlantGrowth[[c(1,2)]]
PlantGrowth[1][2,1]
PlantGrowth[1][2]		#will not work
str(PlantGrowth)
#epxlain
PlantGrowth[1][1][1][1][1][1]

#Function  mean
mean(c(-1,0,1,NA))	#default settings for mean() are not to trim and not to remove NA
mean(na.vec[!is.na(na.vec)])
#Or simply use na.rm=TRUE in mean()
mean(na.vec, na.rm=TRUE)
sem <- function(x) sd(x)/sqrt(length(x))
sem(c(9,-9,0,0,1))
sem(PlantGrowth$weight[PlantGrowth$group=="ctrl"])
sem.valid <- function(x) sqrt(var(x,na.rm=TRUE)/length(na.omit(x)))
apply(X, MARGIN, FUN, ...)
apply(iris[,1:4],2,mean)

iris.num <- iris[sapply(iris, is.numeric)]
apply(iris.num, 2, mean)

#is.numeric will give back TRUE for numeric var and FALSE for other vars
lapply(iris,is.numeric)
$Sepal.Length
$Sepal.Width
$Petal.Length
$Petal.Width
$Species

#Calling sapply(iris, is.numeric) in contrast will give back a vector instead of a list
sapply(iris, is.numeric)

#sepal length means for each
species separately, we may use the tapply function with syntax
tapply(X, INDEX, FUN = NULL, ..., simplify = TRUE)
tapply(iris$Sepal.Length, iris$Species, mean)
with(iris, by(Sepal.Length, Species, mean))
aggregate(iris.num, list(iris$Species), mean)
#by formula
aggregate(. ~ Species, iris, mean)

#Descriptive statistics
summary(iris)
mean(), median(), quantile(), sd()
#Use table() for tabulation (also cross-tabulation)
table(iris$Species)

#Character manipulation
#Extracting substrings and manipulating character vectors using 
substr(), cat(), paste(), parse(), deparse()

#Handling statistical models lm(), the function to fit linear models
data.lm <- lm(formula, data, ...)
pg.lm <- lm(weight ~ group, data=PlantGrowth)
#extracting cofficients or residuals;
print(), summary(), plot(), residuals()

#Packages
library(packages)		#to load
search()		#To see which libraries are loaded

#To detach the car
detach(package:car)
