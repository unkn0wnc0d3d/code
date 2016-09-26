# create vector to make data frame
n <- c(2, 3, 5)
s <- c("aa", "bb", "cc")
d <- c(TRUE, FALSE, TRUE)

# create data from by vector n,s and d.
df1 <- data.frame(n, s)
df2 <- data.frame(n, d)

# add level for add new row to test merge.
levels(df1$s) <- c("aa", "bb", "cc", "dd")

# add a row to each data fram d1 and d2.
df1[nrow(df1) + 1,] <- c(6, "dd")
df2[nrow(df2) + 1,] <- c(7, FALSE)

#df1 <- df1[!df1$n %in% c(6), ]

# inner join from df1 to df2
merge(x=df1, y=df2, by="n")

# left outer join from df1 to df2
merge(x=df1, y=df2, by="n", all.x = TRUE)

# right outer join from df2 to df1
merge(x=df1, y=df2, by="n", all.y = TRUE)

# full outer join 
merge(x=df1, y=df2, by="n", all = TRUE)