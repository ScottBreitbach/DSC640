
# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks9-10/")

# Load libraries
library(ggplot2)

# Load data
costcos <- read.csv("costcos-geocoded.csv", header = TRUE)
ballers <- read.csv("ppg2008.csv", header = TRUE, row.names = 1)
head(costcos)
head(ballers)


## HEAT MAP

# Store data as a matrix for heatmap
baller_matrix <- data.matrix(ballers)

# Pick a different color scheme
bball_heatmap <- heatmap(baller_matrix, Rowv = NA, Colv = NA,
                         col = heat.colors(256),  # sets colors to red / yellow
                         scale = 'column', margins = c(5,10))


## SPATIAL CHART

# Make the map
map(database = 'state', 
    col = '#E31837')    # costco red
# Add the Costcos
symbols(costcos$Longitude, costcos$Latitude, 
        bg = '#005DAA', # costco blue
        fg = '#ffffff', # white
        lwd = 0.1,
        circles = rep(1, length(costcos$Longitude)), 
        inches = 0.05,  # size of circles
        add = TRUE)     # add each to map instead of crating new plot


## CONTOUR PLOT

# show contour only
ggplot(costcos, aes(x=Longitude, y=Latitude)) +
  geom_density2d()

# show area only
ggplot(costcos, aes(x=Longitude, y=Latitude)) +
  stat_density2d(aes(fill = ..level..), geom = 'polygon') +
  theme(legend.position = 'none')

# area + contour
ggplot(costcos, aes(x=Longitude, y=Latitude)) +
  stat_density2d(aes(fill = ..level..), geom = 'polygon', color='white') +
  theme(legend.position = 'none')

# # using raster
# ggplot(costcos, aes(x=Longitude, y=Latitude)) +
#   stat_density2d(aes(fill = ..density..), geom = 'raster', contour = FALSE) +
#   scale_x_continuous(expand = c(0, 0)) + 
#   scale_y_continuous(expand = c(0, 0)) + 
#   theme(legend.position = 'none')

ggplot(ballers, aes(x=PTS, y=FGP)) +
  stat_density_2d(aes(fill = ..level..), geom = 'polygon') +
  scale_fill_distiller(palette= "YlOrRd", direction=1) +
  theme(legend.position = 'none')
# well that's weird....



