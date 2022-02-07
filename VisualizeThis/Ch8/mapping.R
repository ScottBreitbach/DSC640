# Load library
# install.packages('maps')
library(maps)

# Load data
url <- 'http://book.flowingdata.com/ch08/geocode/costcos-geocoded.csv'
costcos <- read.csv(url, sep = ',')

head(costcos)


# Make the map
map(database = 'state')
# Add the costcos
symbols(costcos$Longitude, costcos$Latitude, 
        circles = rep(1, length(costcos$Longitude)), 
        inches = 0.04,  # size of circles
        add = TRUE)     # add each to map instead of crating new plot

# Change the colors of the map and the circles
map(database = 'state', 
    col = '#cccccc')    # gray
symbols(costcos$Longitude, costcos$Latitude, 
        bg = '#e2373f', # red
        fg = '#ffffff', # white
        lwd = 0.1,
        circles = rep(1, length(costcos$Longitude)), 
        inches = 0.05,  # size of circles
        add = TRUE)     # add each to map instead of crating new plot


# Set to 'world' map to see alaska and hawaii
map(database = 'world', col = '#cccccc')
symbols(costcos$Longitude, costcos$Latitude, 
        bg = '#e2373f', fg = '#ffffff', lwd = 0.1,
        circles = rep(1, length(costcos$Longitude)), 
        inches = 0.05, add = TRUE)  


# Get just a few states with the `region=` argument
map(database = 'state', col = '#cccccc', 
    region = c('California', 'Nevada', 'Oregon', 'Washington'))
symbols(costcos$Longitude, costcos$Latitude, 
        bg = '#e2373f', fg = '#ffffff', lwd = 0.1,
        circles = rep(1, length(costcos$Longitude)), 
        inches = 0.05, add = TRUE)  


## MAP WITH LINES

# Load data
url <- 'http://book.flowingdata.com/ch08/points/fake-trace.txt'
faketrace <- read.csv(url, sep = '\t')
faketrace

# plot with lines
map(database = 'world', col = '#cccccc')
lines(faketrace$longitude, faketrace$latitude, col = '#bb4cd4', lwd = 2)
# add some dots
symbols(faketrace$longitude, faketrace$latitude,
        lwd = 1, bg = '#bb4cd4', fg = '#ffffff',
        circles = rep(1, length(faketrace$longitude)),
        inches = 0.04, add = TRUE)

# draw again with lines from one location to all others
map(database = 'world', col = '#cccccc')
for (i in 2:length(faketrace$longitude) -1) {
  lngs <- c(faketrace$longitude[8], faketrace$longitude[i])
  lats <- c(faketrace$latitude[8], faketrace$latitude[i])
  lines(lngs, lats, col = '#bb4cd4', lwd = 1.5)
}


## MAP WITH BUBBLES

# Load data (births per 1,000 women)
url <- 'http://book.flowingdata.com/ch08/points/adol-fertility.csv'
fertility <- read.csv(url)
head(fertility)

# Map it
map('world', fill = FALSE, col = '#cccccc')
symbols(fertility$longitude, fertility$latitude,
        circles = sqrt(fertility$ad_fert_rate), add = TRUE,
        inches = 0.15, bg = '#93ceef', fg = '#ffffff')

# get a summary
summary(fertility$ad_fert_rate)


## MAP COUNTIES
# http://book.flowingdata.com/ch08/regions/unemployment-aug2010.txt




