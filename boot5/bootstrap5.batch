#! /usr/bin/env Rscript
#SBATCH -p shared
#SBATCH --mem 2g
#SBATCH -t 0-06:00
#SBATCH -c 4
#SBATCH -o out_%A_%a.out   # standard output
#SBATCH -e err_%A_%a.out   # standard error
#SBATCH -a 1-4

library(parallel)
library(Rcpp)
sourceCpp("boot_cpp.cpp")

nrep <- c(10, 100, 1000, 10000)

data(mtcars)

x <- as.matrix(cbind(1, mtcars$wt, mtcars$hp))
y <- mtcars$mpg

id <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))

system.time(b_cpp <- boot_cpp(nrep[id], x, y))


