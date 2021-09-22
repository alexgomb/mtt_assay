#import excel file to a data frame
library("readxl")
mtt_data<- read_excel("mtt_data_1.xlsx", 
                      col_names = FALSE)
#dataframe to matrix
mtt_matrix <- as.matrix(mtt_data)
#mean of the control groups
pos_control_mean <- mean(c(mtt_matrix[,2], mtt_matrix[,11]))
#relativize abs data
relative_mtt_data <- (mtt_matrix/pos_control_mean)*100
#remove not used wells
relative_means <- colMeans(relative_mtt_data[,c(-1,-12)])
#plot the data
barplot(relative_means, main = "viability", xlab="ratio", ylab = "cell viability (%)", names.arg = c("Control", rep("10:1",2), rep("8:1", 2), rep("5:1", 2), rep("2:1", 2), "Control"))