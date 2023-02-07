#Written by Aalok Sharma Kafle
#CVEN 5301 Optimization for Engineers
#TOPSIS


#IMport necessary libraries
library("topsis")
library("CGE")
suppressPackageStartupMessages(library("gdata")) # #Supress gdata's warning
library("gdata") #useful for creating pairwise matrix

#Set working directory
setwd('C:\\Users\\Aalok\\OneDrive - lamar.edu\\0000CVENOptimization')

#IMport the data
a <- read.csv('topsis.csv', header = TRUE, skip=0, row.names=1)
datmat <- as.matrix(a) #Make a matrix of the data

#Vector of weight and its impact
wt = c(0.1,0.2,0.1,0.1,0.1,0.1,0.1,0.1,0.1) #WEIGHTS
imp = c('+','-','-','+','+','+','-','+','+') #IMPACT - benefit (+) or negative benefit (-)

#Run TOPSIS
decision = topsis(datmat, wt, imp)
decision   #to write the output ranking

