#load the library
library(tidyverse)
#function read.csv2 for european csv files
mtt_data <- read.csv2("mtt_data_1.csv", header = FALSE)
#remove the border columns
mtt_data <- (mtt_data[,-c(1,12)])*100
#calculate the mean for each column
mean_col <- as.vector(apply(mtt_data, 2, mean))
#mean of the positive controls
mean_col_control <- mean(mean_col[c(1,10)])
#relativize the cell viability of each well to the control
mtt_data_rel <- (sweep(mtt_data, 2, mean_col_control, "/"))*100
#calculate the sd of each column
sd_mtt <- apply(mtt_data_rel, 2, sd)
#mean of viability value for each experimental group and build the data frame
exp_group <- c("Control 1", "10:1", "10:1 p", "8:1", "8:1 p", "5:1", "5:1 p", "2:1", "2:1 p", "Control p")
viability <- as.vector(apply(mtt_data_rel, 2, mean))
viability<- data.frame(viability, row.names = exp_group)
#build the plot
ggplot(data = viability, aes(x = exp_group, y= viability)) + 
  geom_bar( stat = "identity", 
            group = 1, width=0.5) +
  geom_errorbar(aes(ymin = viability - sd_mtt, ymax = viability + sd_mtt), width = 0.2)