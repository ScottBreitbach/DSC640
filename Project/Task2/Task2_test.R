# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Project/")

# Load libraries
library(ggplot2)
library(dplyr)

# Load data
fpbDF <- read.csv("Passenger-Fatalities-per-Billion.csv")
fpbDF

# Set color palette
colPal = "Set1"

# Bar plot of fatalities per billion miles
ggplot(fpbDF, aes(x=Mode_of_Transport, y=Fatal_per_Bil_mi)) + 
  geom_bar(stat = "identity") +
  coord_flip()

# Fix order of barplot; sort by number of fatalities
fpbDF %>%
  arrange(Fatal_per_Bil_mi) %>%    # First sort by val. This sort the dataframe but NOT the factor levels
  mutate(Mode_of_Transport=factor(Mode_of_Transport, levels=Mode_of_Transport)) %>%   # This trick update the factor levels
  # ggplot(aes(x=Mode_of_Transport, y=Fatal_per_Bil_mi)) +
  ggplot(aes(x=Mode_of_Transport, y=Fatal_per_Bil_mi, fill=Mode_of_Transport)) +
  geom_bar(stat = "identity", width = 0.3) +#( aes(xend=name, yend=0)) +
  # geom_point( size=4, color="orange") +
  scale_fill_brewer(palette = colPal) +
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
















