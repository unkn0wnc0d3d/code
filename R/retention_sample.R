# load UU test data.
testUU <- read.csv(file = "/Users/sunge/proj/code/R/testUU.csv", sep = ",", header = TRUE)

# show test UU data.
testUU

# to calculate retention, need to selft join.
uuX <- testUU;
uuY <- testUU;

# self join. 
m <- merge(x=uuX, y=uuY, by="userNo")


ret <-m[m$loginDate.x <= m$loginDate.y,]

# show selft join result.
head(x=m, n=1)

# after aggregation, result set will be like below
#          20160101 20160102 20160103 20160104 20160105 20160106 20160107 
# 20160101      3         3         2       3         1       2       2
# 20160102                3         2       3         1       2       2
# 20160103                          2       2         1       2       1
# 20160104                                  3         1       2       2
# 20160105                                            1       1       1
# 20160106                                                    2       1
# 20160107                                                            2
agr1 <- aggregate(x=ret$userNo
          , by=list(factor(ret$loginDate.x), factor(ret$loginDate.y))
          , FUN=length)
colnames(agr1) <- c("g1", "g2", "val")
head(x=agr1, n=1)

# draw above metrix to graph.
ggplot(data=agr1, aes(x=g2, y=val, group=g1)) + 
  geom_line() +
  facet_grid(g1 ~ .)
 
