dataURL <- "http://datasets.flowingdata.com/crimeRatesByState2005.csv"

# Load the data
crime <- read.csv(dataURL, sep = ",", header = TRUE)
# Note: crime rates per 100,000 people
crime[1:3,]
head(crime, 3)

# Scatterplot: murder v burglary
plot(crime$murder, crime$burglary)

# Remove Washington, DC b/c outlier
crime2 <- crime[crime$state != "District of Columbia",]
# And remove United States b/c averages
crime2 <- crime2[crime2$state != "United States",]

# Plot murder v burglary again
plot(crime2$murder, crime2$burglary)
# Plot again w/axes starting at zero
plot(crime2$murder, crime2$burglary, 
     xlim = c(0, 10), ylim = c(0, 1200))
# Plot again adding a LOESS curve (see Ch 4)
scatter.smooth(crime2$murder, crime2$burglary, 
               xlim = c(0, 10), ylim = c(0, 1200))

# Create a scatterplot matrix
plot(crime2[,2:9])
# Plot again, adding LOESS curves
pairs(crime2[,2:9], panel = panel.smooth)

## BUBBLE CHART ##

dataURL <- "http://datasets.flowingdata.com/crimeRatesByState2005.tsv"

# Load the data
crime <- read.csv(dataURL, header = TRUE, sep = "\t")

# Create a bubble plot
symbols(crime$murder, crime$burglary, circles = crime$population)
# Note: circle sizes are based on radius by default; this is wrong
# Math the radius
radius <- sqrt( crime$population / pi )
symbols(crime$murder, crime$burglary, circles = radius)
# now everything smaller than CA is just bigger 
# scale down all the circles using `inches =`
# make the maxiumum 0.35 inches
# change colors using fg (stroke color) and bg (fill color)
symbols(crime$murder, crime$burglary, circles = radius, inches = 0.35,
        fg = "white", bg = "red", xlab = "Murder Rate", ylab = "Burglary Rate")

# Plot again with squares (square root of size to get correct area)
symbols(crime$murder, crime$burglary, 
        squares = sqrt(crime$population), inches = 0.5)

# Back to circles; add some labels
symbols(crime$murder, crime$burglary, circles = radius, inches = 0.35,
        fg = "white", bg = "red", xlab = "Murder Rate", ylab = "Burglary Rate")
text(crime$murder, crime$burglary, crime$state, cex = 0.5)


## DISTRIBUTION ##

dataURL <- "http://datasets.flowingdata.com/birth-rate.csv"

# Load data
birth <- read.csv(dataURL)

# Create stem-and-leaf plot
stem(birth$X2008)

# Create a histogram
hist(birth$X2008)
# Decrease to 5 breaks
hist(birth$X2008, breaks = 5)
# Increase to 20 breaks
hist(birth$X2008, breaks = 20)

# Get some summary stats
summary(birth$X2008)

# Create a density plot using `density()` function
# Note: can't have any Null values, so remove those first
b08 <- birth$X2008[!is.na(birth$X2008)]
# pass to density function
d08 <- density(b08)
d08
d08$x

# Write to a text file, just for fun
# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/VisualizeThis/Ch6/")
# Put coordinates in a data frame
d08DF <- data.frame(d08$x, d08$y)
# Save to text file
write.table(d08DF, "birthDensity2008.txt", sep = "\t")
write.table(d08DF, "birthDensity2008csv.txt", sep = ",", row.names = FALSE)
# Now you can load the data in another program!

# Back to our previously scheduled density plot
plot(d08)
# Make a filled density plot
plot(d08, type = "n")   # "n" for no plotting
polygon(d08, col = "#821122", border = "#cccccc")

# Now plot the density plot over the histogram
library(lattice)
histogram(birth$X2008, breaks = 10)
lines(d08)  # for some reason this isn't adding the density plot



## COMPARISON ##

# Create a histogram matrix
# Fix the data in Python first...

birthYearly <- read.csv("birth-rate-yearly.csv")

histogram(~ Rate | Year, data = birthYearly, layout = c(10,5))

summary(birthYearly)

# Remove outlier of 132 (probably supposed to be 13.2)
birthYearly.new <- birthYearly[birthYearly$Rate < 132,]

histogram(~ Rate | Year, data = birthYearly.new, layout = c(10,5))

# Change Years to characters so they format correctly
birthYearly.new$Year <- as.character(birthYearly.new$Year)

histogram(~ Rate | Year, data = birthYearly.new, layout = c(10,5))

# Time to update the order
# Store the histogram matrix as a variable
h <- histogram(~ Rate | Year, data = birthYearly.new, layout = c(10,5))

# Use `update()` to update the order
update(h, index.cond = list(c(41:50, 31:40, 21:30, 11:20, 1:10)))


# Television sizes over the years
# Load data
tvs <- read.table('http://datasets.flowingdata.com/tv_sizes.txt', 
                  sep = '\t', header = TRUE)

# Filter outliers
tvs <- tvs[tvs$size < 80, ]
tvs <- tvs[tvs$size > 10, ]

# Set breaks for histograms
breaks = seq(10, 80, by=5)

# Set the layout
par(mfrow=c(4,2))

# Draw histograms, one by one
hist(tvs[tvs$year == 2009,]$size, breaks = breaks)
hist(tvs[tvs$year == 2008,]$size, breaks = breaks)
hist(tvs[tvs$year == 2007,]$size, breaks = breaks)
hist(tvs[tvs$year == 2006,]$size, breaks = breaks)
hist(tvs[tvs$year == 2005,]$size, breaks = breaks)
hist(tvs[tvs$year == 2004,]$size, breaks = breaks)
hist(tvs[tvs$year == 2003,]$size, breaks = breaks)
hist(tvs[tvs$year == 2002,]$size, breaks = breaks)


