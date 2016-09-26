myRevn <- read.csv(file="c:/temp/sample.csv", header = TRUE, sep = ",")

head(myRevn, n=100)

mySum <- aggregate(x=as.integer(myRevn$net), by=list(myRevn$year), FUN=sum)
colnames(mySum)[1] = "year"
mySum

install.packages("ggplot2")
library(ggplot2)


qplot(x=mySum$year, data=mySum, weight=mySum$x, binwidth=0.5)