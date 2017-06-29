rm(list=ls())             # Clean the environment
options(scipen=6)         # Display digits, not the scientific version
options(digits.secs=6)    # use milliseconds in Date/Time data types
options(warning=FALSE)    # Don't show warnings
par(mfrow=c(1,1))         # reset plot placement to normal 1 by 1

directory <- getwd()
origDataFolder    <- file.path(directory, "data/original")
tmpDataFolder     <- file.path(directory, "data/tmp")
resultsDataFolder <- file.path(directory, "data/results")
figureFolder      <- file.path(directory, "figures")

#--- test
balabl