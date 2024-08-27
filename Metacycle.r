#### TIME COURSE ANALYSIS - 
# PACKAGE : METACYCLE,
#DATA : TIME COURSE DATA, GENES AS FIRST COLUMN AND OTHER COLUMNS AS TIMES,
#      sO GENE EXPRESSION DATA NEEDED TO BE COLLECTED IN A TIME COURSE MANNER
#AUTHOR : Saher Raouf, CHU LAB
#DATE : 2024-06-26



# Load the necessary libraries
library(tidyr)
library(dplyr)
library(MetaCycle)

# Read the data
data <- read.csv("Sub743_detrended_10_9_transposed_100_800_56samples (1).csv", row.names = 1)
#CHECK column names
colnames(data)


# second column where the time points begin from 100th, sampling is every 12.5 minutes 
#and final "time point column number " is 57. (total columns 58 where first column is GENE)
timepoints <- seq(100, by = 12.5, length.out = 57)


## MINPER and MAXPER is set in minutes, if you want to test from 5-6 hrs then 300 to 360 minutes



##This is to test for HES7 periodicity initially  4.8 hrs to 6.3 hrs?
result <- meta2d(infile="Sub743_detrended_10_9_transposed_100_800_56samples (1).csv", 
                 filestyle="csv", outdir="metaout290-380", 
                 timepoints=timepoints, minper=290, maxper=380, 
                 cycMethod=c("LS"), outIntegration="noIntegration")



### 5 HOURS TO 6.1 HOURS
result <- meta2d(infile="Sub743_detrended_10_9_transposed_100_800_56samples (1).csv", 
                 filestyle="csv", outdir="metaout300-370", 
                 timepoints=timepoints, minper=300, maxper=370, 
                 cycMethod=c("LS"), outIntegration="noIntegration")





