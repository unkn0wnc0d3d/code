testGroup <- data.frame(
              g1 = c(1, 1, 1, 2)    #first grouping field.
            , g2 = c(1, 1, 2, 2)    #second grouping field.
            , val1 = c(1, 2, 3, 4)  #test value
            , val2 = c(2, 3, 4, 5)  #test value
            , val3 = c(4, 5, 6, 7)  #test value
            );

#show test data.
testGroup

# make factor for each grouping field.
# thoes are used agrgregation funtion.
fby1 <- factor(testGroup$G1)
fby2 <- factor(testGroup$G2)

aggregate(x = list(v1=testGroup$val1, v2=testGroup$val2)
          , by = list(g1=fby1, g2=fby2) #use fby1 and fby2 here.
          , FUN = function(x) c(m=mean(x), s=sum(x)) #make function to make multi aggreated value
          )