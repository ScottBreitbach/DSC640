# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Project/")

# Load libraries
library(ggplot2)
library(dplyr)

# Load data
fpbDF <- read.csv("Passenger-Fatalities-per-Billion.csv")
fpbDF

modeDF <- read.csv("modeOfTransport.csv")
modeDF

# Set color palette
colPal = "Dark2"
swBlu = "#2E4BB1"
swRed = "#E61C23"
swYel = "#FDB912"

# Bar plot of fatalities per billion miles
ggplot(fpbDF, aes(x=Mode_of_Transport, y=Fatal_per_Bil_mi)) + 
  geom_bar(stat = "identity") +
  coord_flip()

# Fix order of barplot; sort by number of fatalities
fpbDF %>%
  arrange(Fatal_per_Bil_mi) %>%    # First sort by val. This sort the dataframe but NOT the factor levels
  mutate(Mode_of_Transport=factor(Mode_of_Transport, levels=Mode_of_Transport)) %>%   # This trick update the factor levels
  # ggplot(aes(x=Mode_of_Transport, y=Fatal_per_Bil_mi)) +
  ggplot(aes(x=Mode_of_Transport, y=Fatal_per_Bil_mi)) +
  geom_bar(stat = "identity", width = 0.4) +#( aes(xend=name, yend=0)) +
  # geom_point( size=4, color="orange") +
  # scale_fill_brewer(palette = colPal) +
  # theme_bw() +
  theme(legend.position = "none") +
  coord_flip() +
  geom_text(aes(label = Fatal_per_Bil_mi), hjust = "inward") +
  xlab("") + ylab("Fatalities") +
  ggtitle("Fatalities per Billion Miles Traveled")


# # 3: Using RColorBrewer
# ggplot(mtcars, aes(x=as.factor(cyl), fill=as.factor(cyl) )) + 
#   geom_bar( ) +
#   scale_fill_brewer(palette = "Set1") +
#   theme(legend.position="none")


modeDF %>%
  arrange(Fatal_per_Bil_km) %>%    # First sort by val. This sort the dataframe but NOT the factor levels
  mutate(Mode_of_Transport=factor(Mode_of_Transport, levels=Mode_of_Transport)) %>%   # This trick update the factor levels
  ggplot(aes(x=Mode_of_Transport, y=Fatal_per_Bil_hr)) +
  geom_bar(stat = "identity", width = 0.4) +
  theme(legend.position = "none") +
  coord_flip() +
  geom_text(aes(label = Fatal_per_Bil_hr), hjust = "inward") +
  xlab("") + ylab("Fatalities") +
  ggtitle("Fatalities per Billion Hours Traveled")

modeDF %>%
  arrange(Fatal_per_Bil_km) %>%    # First sort by val. This sort the dataframe but NOT the factor levels
  mutate(Mode_of_Transport=factor(Mode_of_Transport, levels=Mode_of_Transport)) %>%   # This trick update the factor levels
  ggplot(aes(x=Mode_of_Transport, y=Fatal_per_Bil_Trips)) +
  geom_bar(stat = "identity", width = 0.4) +
  theme(legend.position = "none") +
  coord_flip() +
  geom_text(aes(label = Fatal_per_Bil_Trips), hjust = "inward") +
  xlab("") + ylab("Fatalities") +
  ggtitle("Fatalities per Billion Trips")

modeDF %>%
  arrange(Fatal_per_Bil_km) %>%    # First sort by val. This sort the dataframe but NOT the factor levels
  mutate(Mode_of_Transport=factor(Mode_of_Transport, levels=Mode_of_Transport)) %>%   # This trick update the factor levels
  ggplot(aes(x=Mode_of_Transport, y=Fatal_per_Bil_km)) +
  geom_bar(stat = "identity", width = 0.4) +
  theme(legend.position = "none") +
  coord_flip() +
  geom_text(aes(label = Fatal_per_Bil_km), hjust = "inward") +
  xlab("") + ylab("Fatalities") +
  ggtitle("Fatalities per Billion Kilometers Traveled")


#================================#

# Load data
accYrDF <- read.csv("ASN_accid_fatal_passenger_yr_filtered.csv")

names(accYrDF)

barWidth = 0.9

# Plot data
ggplot(accYrDF, aes(x=Year)) +
  geom_bar(aes(y=Accidents), 
           stat = "identity", fill = swBlu, width = barWidth) +
  geom_line(aes(y=NumAcc5YrAvg), color = swRed, size = 1) +
  ggtitle("Fatal Accidents: Passenger Flights by Year") +
  ylab("Number of Fatal Accidents") +
  theme_classic()


ggplot(accYrDF, aes(x=Year)) +
  geom_bar(aes(y=World.air.traffic..MM.departures.), 
           stat = "identity", fill = swBlu, width = barWidth) +
  ggtitle("Number of Flights per Year") +
  ylab("Number of Flights (millions)") +
  theme_classic()

ggplot(accYrDF, aes(x=Year)) +
  geom_bar(aes(y=Fatal.accidents.per.mln.flights), 
           stat = "identity", fill = swBlu, width = barWidth) +
  geom_line(aes(y=AccPrM5YrAvg), color = swRed, size = 1) +
  ggtitle("Fatal Accidents per Million Flights") +
  ylab("Accidents per Million") +
  theme_classic()
