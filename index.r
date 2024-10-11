# Installs
if (!require(jsonlite)) install.packages("jsonlite", dependencies=TRUE)
if (!require(ggplot2)) install.packages("ggplot2", dependencies=TRUE)

library(jsonlite)
library(ggplot2)

data <- fromJSON("Users/maxes/OneDrive/Documents/Visual Studio Code/R/data.json")
history <- data$history

history$createdat <- as.POSIXct(history$createdat, format="%Y-%m-%dT%H:%M:%S", tz="UTC")

ggplot(history, aes(x = createdat)) +
  geom_line(aes(y = price, color = "Price")) +
  geom_line(aes(y = sold, color = "Sold")) +
  scale_color_manual(name = "Legend", values = c("Price" = "blue", "Sold" = "red")) + 
  labs(title = "Item History", x = "Date", y = "Value") +
  theme_minimal()
