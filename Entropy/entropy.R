#Necessary libraries
library(gdata)
library(CGE)
library(topsis)

#Calculate x* logx
mat_fun <- function(x) {x * log(x)}

#Set Working DIrectory
setwd('C:\\Users\\Aalok\\OneDrive - lamar.edu\\0000CVENOptimization')


#Import Data
a <- read.csv('concretedata.csv', row.names =1)

#Data Summary
summary(a)


#Make matrix of data
datmat <- as.matrix(a)

#Normalize the data
normdat <- (datmat %*% diag(1/colSums(datmat))) + (1*10^-16) #Prevent it from being zero or NA

#Get x * log x by using predefined function
mat_new <- apply(normdat, c(1, 2), mat_fun)

#Get number of alternatives in the problem
Nalter <- nrow(datmat)

#Calculating Entropy
ej <- (- 1/log(Nalter))*colSums(mat_new)

#Degree of diversification/diversion
dj <- (1 - ej)

#Getting Weights
wts <- dj/sum(dj)
wts <- round(wts,4)
wts

# Applying TOPSIS with calculated weights using the OG matrix


# decide if the benefit is negative/positive on the compressive strength
#Corr with CS can be determined
impcts <- c('+','+','-','-','+','-','-','+')

#Getting topsis result
decision = topsis(datmat, wts, impcts)

#Order the alternatives based on rank
decision_order <- decision[order(decision$rank),]


#Import Data with compressive strength and look and the correlation between parameters
#Cab be used to determine the sign of impact used above
b <- read.csv('concrete_data.csv')
colnames(b) <- c('cem', 'slag','fly_as','water','SP','CA','FA','age','CS')
c <- round(cor(b),2)
c