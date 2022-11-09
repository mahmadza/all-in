

# Generate synthetic data of the IPO data sets using Synthpop in R
library("synthpop")

real_data <- read.csv('IPO_2017to2022.csv')
synth_data <- syn(real_data)
write.csv(synth_data$syn, 'IPO_2017to2022_synthetic.csv')
