awk '{print $6}' memory.mpi.au16.9 > 1 ; R -q -e "x <- read.csv('1', header = F); summary(x); sd(x[ , 1])"
