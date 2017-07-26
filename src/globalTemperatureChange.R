# Get paths
setwd('..')
dataFolder    <- file.path(getwd(), "data")            # Data folder
resultsFolder <- file.path(getwd(), "docs/results")         # Result folder
figureFolder  <- file.path(getwd(), "docs/figures")         # Figure Folder

# Libraries
library(ape)
library(dichromat)
library(FNN)
library(ggplot2) 
library(gdistance)
library(gridExtra)
library(gstat)
library(raster)
library(rasterVis)
library(rgdal)
library(rgeos)
library(sp)