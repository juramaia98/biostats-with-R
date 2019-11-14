#A Simple R Use-case

#Load packages
library(ggplot2)
library(dplyr)


# Generate a dataframe ----------------------------------------------------

#rep(x, y) replicates x, y times
#c(x, y, z) concatenates x, y, and z into a single vector

species <- rep(c('P tenuis', 'H speoris', 'M lyra'), each = 9) 
year <- rep(c('2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019'), times = 3)
collections <- c(runif(n = 9, min = 0, max = 36) %>% sort(),
                 runif(n = 9, min = 3, max = 41) %>% sort(),
                 runif(n = 9, min = 6, max = 13) %>% sort(decreasing = T))
data <- data.frame(species, year, collections)

View(data)


# Plot the data with a time series line plot ------------------------------

ggplot(data = data, 
       aes(x=year, y=collections, group=species)) + 
  
  geom_point(aes(colour=species), size = 3) + 
  
  geom_line(aes(colour = species), size = 1.5)
