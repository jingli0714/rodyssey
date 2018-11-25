#! /usr/bin/env Rscript
#SBATCH -p shared
#SBATCH --mem 2g
#SBATCH -t 0-06:00
#SBATCH -c 10
#SBATCH -o out1.txt   # standard output
#SBATCH -e err1.txt   # standard error

library(parallel)

boot_onestep <- function(i) {
  didx <- mtcars[sample(1:nrow(mtcars), replace = TRUE, nrow(mtcars)), ]
  xidx <- cbind(1, didx$wt, didx$hp); yidx <- didx$mpg
  coeffidx <- solve(t(xidx) %*% xidx) %*% t(xidx) %*% yidx
  return(t(coeffidx))
}

system.time(b_nrep10_c_1 <- t(mcmapply(boot_onestep, 1:10000, mc.cores = 1)))
system.time(b_nrep10_c_1 <- t(mcmapply(boot_onestep, 1:10000, mc.cores = 10)))