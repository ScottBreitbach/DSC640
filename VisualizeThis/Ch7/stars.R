## STAR charts, a.k.a RADAR or SPIDER charts

# Load data
crime <- 
  read.csv('http://datasets.flowingdata.com/crimeRatesByState-formatted.csv')

head(crime)


# Create star charts
stars(crime)


# Set row names to state names
row.names(crime) <- crime$state
crime <- crime[,2:7]

# Align labels and add a key
stars(crime, flip.labels = FALSE, key.loc = c(15, 1.5))


# Variations
# Restrict all data to the top half of the circle
stars(crime, flip.labels = FALSE, key.loc = c(15, 1.5), full = FALSE)
# Nightingale charts, a.k.a. polar area diagrams
stars(crime, flip.labels = FALSE, key.loc = c(15, 1.5), draw.segments = TRUE)

