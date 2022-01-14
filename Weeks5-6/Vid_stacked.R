# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks5-6/")

stackedData <- read.csv("expenditures.csv")

head(stackedData)

library(ggplot2)

plot <- ggplot(data = stackedData,
               aes(x = as.numeric(year),
                   y = expenditure,
                   fill = category))

plotWithGeom <- plot + geom_area(aes(color = stackedData$category,
                                     fill = stackedData$category))

plotWithGeom

# Density gradient or mixture of similar colors

plotWithGeom2 <- plot + geom_area(color = "black",
                                  size = 0.2,
                                  alpha = 0.4) # + scale_fill_brewer(palette = 'Blues')

colors()

# Palette types: Blues, BuGn, BuPu, GnBu, Greens, Greys, Oranges, 

?scale_fill_brewer
plotWithGeom2

# This is supposed to flip the order but doesn't?
plotWithGeomBreaksRev <- plot + geom_area(color = "black",
                                  size = 0.2,
                                  alpha = 0.4) + scale_fill_brewer(palette = 'Blues',
                                                                   breaks = rev(levels(stackedData$Type)))

levels(stackedData$category)

plotWithGeomBreaksRev
