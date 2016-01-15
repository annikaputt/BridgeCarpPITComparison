############################
# ComparePIT.R
# Project: BridgeCarpPITComparison.Rproj

# File description: Reads in a file of PIT code from MON3 and compares them to all fish in the 
# BRGMONfishid database.

# Created: January 14, 2016
# R Version: 3.2.0
# GitHub: Yes
# Author: A Putt
############################
library(compare)

# Read in MON3 codes
mon3 <- read.csv("2015_LBR_PIT_Codes_fromNich.csv",head=TRUE,colClasses=c("pit_codes"="character","pitlast6"="character","site"="character"))

# Read in the BRGMON database
# Read in the fishid table. It must be saved in the working directory as brgmonfishid_current.csv.
fishid <- read.csv("brgmonfishid_current.csv",head=TRUE, colClasses=c("fishid"="character","sitedescription"="character","pit"="character","structurecode"="character","age"="character",
                                                                      "spawningcondition"="character","fishidcomments"="character","tissue.sediment"="character","recap"="logical",
                                                                      "radio.acoustic"="character","mort."="logical","y"="factor","pitlast6"="character"))

# Look for duplicates in a couple ways:

# Compare the two data frames
comparison <- compare(unique(mon3$pitlast6),unique(fishid$pitlast6))

# Create a new data frame and look for duplicates
test <- data.frame(project=c(rep("mon3",length(unique(mon3$pitlast6))),rep("fishid",length(unique(fishid$pitlast6)))),
                   pitlast6=c(unique(mon3$pitlast6),unique(fishid$pitlast6)))
