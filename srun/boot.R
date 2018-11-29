library(parallel)
detectCores() # e.g., 32 cores on the node, not cores reserved by srun

boot_onestep <- function(i) {
  didx <- mtcars[sample(1:nrow(mtcars), replace = TRUE, nrow(mtcars)), ]
  xidx <- cbind(1, didx$wt, didx$hp); yidx <- didx$mpg
  coeffidx <- solve(t(xidx) %*% xidx) %*% t(xidx) %*% yidx
  return(t(coeffidx))
}

b_nrep10_c_1 <- t(mcmapply(boot_onestep, 1:10, mc.cores = 1))
b_nrep10_c_1

system.time(b_nrep10000_c_1 <- t(mcmapply(boot_onestep, 1:10, mc.cores = 1)))
system.time(b_nrep10000_c_10 <- t(mcmapply(boot_onestep, 1:10, mc.cores = 10)))
system.time(b_nrep10000_c_10 <- t(mcmapply(boot_onestep, 1:10000, mc.cores = 10)))
