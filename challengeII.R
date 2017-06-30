# -------------------------------------------------------------------------
# GEO871 - Challenge II
#
# Author: Merlin Unterfinger, Olivier Niklaus
# Date: 29.06.17
#
# Step: Read files
# -------------------------------------------------------------------------
# Options
rm(list=ls())             # Clean the environment
options(scipen=6)         # Display digits, not the scientific version
options(digits.secs=6)    # use milliseconds in Date/Time data types
options(warning=FALSE)    # Don't show warnings
par(mfrow=c(1,1))         # reset plot placement to normal 1 by 1

# Paths
directory <- getwd()
dataFolder       <- file.path(directory, "data/")
resultDataFolder <-file.path(directory, "results/")
figureFolder     <- file.path(directory, "figures")

# Libraries
library(rgdal)
library(sp)
library(raster)
library(gstat)
library(FNN)
library(spdep)

# Read data ---------------------------------------------------------------
# Set CRS
WGS84 <- CRS("+init=epsg:4326")

# Open temperature and separate to time
temp <- read.csv(file.path(dataFolder, "temperature.csv"))
sample(nrow(temp), floor(nrow(temp)/20))
coordinates(temp)<-~long+lat
proj4string(temp)<-WGS84

# Seperate data according to timeFrame and season:
# temp1970w, temp1970s, temp2010w, temp2010s
timeSeasons <- c(SpatialPointsDataFrame(coords = temp@coords, data = temp@data[,1:2]),
                 SpatialPointsDataFrame(coords = temp@coords, data = temp@data[,c(1,3)]),
                 SpatialPointsDataFrame(coords = temp@coords, data = temp@data[,c(1,4)]),
                 SpatialPointsDataFrame(coords = temp@coords, data = temp@data[,c(1,5)]))

for (i in 1:4){
  colnames(timeSeasons[[i]]@data) <- c()
}

t <- timeSeasons[[1]]

# Open test file
temp.test <- read.csv(file.path(dataFolder, "temperature_test.csv"))
coordinates(temp.test) <- ~long+lat
proj4string(temp.test) <- WGS84

# Open digital elevation model
DEM <-readGDAL(file.path(dataFolder, "globalDHM.tif"))

# Set up grid -------------------------------------------------------------
grid <- spsample(DEM,type="regular",10000)
grid <- SpatialPointsDataFrame(grid@coords,data.frame(elevation=extract(raster(DEM),grid)))

# H-scatterplots ----------------------------------------------------------
# Creating h-scatterplots for the h=1:10 (c.f. Isaaks&Srivastava p.54)
hscat(log(meansum)~1, t, breaks, pch = 3, cex = .6, mirror = FALSE, 
      variogram.alpha = 0,...)


timeSeasons.d <- lapply(timeSeasons, spDists, longlat = FALSE)

perc.d<-spDists(perc,longlat = FALSE)

perc.ind<-knn.index(perc.d, k=20, algorithm=c("kd_tree"))

perc.h<-data.frame(sum=perc$sum,sumNN1=perc$sum[perc.ind[,1]],sumNN5=perc$sum[perc.ind[,5]],sumNN10=perc$sum[perc.ind[,10]],sumNN20=perc$sum[perc.ind[,20]])

par(mfrow=c(2,2))
plot(perc.h$sum,perc.h$sumNN1,main="h = 1")
plot(perc.h$sum,perc.h$sumNN5,main="h = 5")
plot(perc.h$sum,perc.h$sumNN10,main="h = 10")
plot(perc.h$sum,perc.h$sumNN20,main="h = 20")
