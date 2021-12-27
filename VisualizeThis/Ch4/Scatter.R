# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/VisualizeThis/Ch4/")

# Load Data
subscribers <- 
  read.csv("http://datasets.flowingdata.com/flowingdata_subscribers.csv", 
           sep = ",", 
           header = TRUE)

head(subscribers)

subscribers[1:5,]

# Plot the subscribers
plot(subscribers$Subscribers)

# Plot with some parameters specified
plot(subscribers$Subscribers, type = "p", ylim = c(0, 30000))

# Plot again using high density vertical lines
plot(subscribers$Subscribers, type = "h", ylim = c(0, 30000))

# Plot using both points and lines (lines first then add points)
plot(subscribers$Subscribers, type = "h", ylim = c(0, 30000), 
     xlab = "Day", ylab = "Subscribers")
points(subscribers$Subscribers, pch = 19, col = "black")

