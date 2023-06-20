
# Generate synthetic data of the IPO data sets using Synthpop in R
setwd('Documents/GitHub/all-in/')
library("synthpop")
library("dplyr")

real_data <- read.csv('IPO_2017to2023.csv')

# reshape real data and generate synthetic data
real_data <- subset(real_data, select = -c(TICKER) )
real_data <- real_data[-1,1:11]
# synthesize 200 IPOs
synth_data <- syn(real_data, k = 200, smoothing = 'spline')$syn

# resort
synth_data<-synth_data[order(synth_data$YEAR, decreasing = TRUE),]  

# recreate column TICKER and move to the first position
synth_data$TICKER<-1:nrow(synth_data)
synth_data <- synth_data %>% select(TICKER, everything())

# write to file
write.csv(synth_data, 'IPO_2017to2023_synthetic.csv', row.names=FALSE)
