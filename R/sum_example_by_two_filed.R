testGroup <- data.frame(
              g1 = c(1, 1, 1, 2)
            , g2 = c(1, 1, 2, 2)
            , val1 = c(1, 2, 3, 4)
            , val2 = c(2, 3, 4, 5)
            , val3 = c(4, 5, 6, 7));

testGroup

fby1 <- factor(testGroup$G1)
fby2 <- factor(testGroup$G2)

aggregate(x = list(v1=testGroup$val1, v2=testGroup$val2)
          , by = list(g1=fby1, g2=fby2) # make list to group by two field
          , FUN = function(x) c(m=mean(x), s=sum(x)) #make function to make multi aggreated value
          )