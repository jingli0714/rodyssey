# rodyssey
Batch scripts to illustrate how to use Odyssey for R jobs

- `srun/boot.R`: interactive job
- `boot1/bootstrap1.batch`: vanilla bootstrap
- `boot2/bootstrap2.batch`: using `SLURM_ARRAY_TASK_ID`
- `boot3/bootstrap3.batch`: better formatting of the results
- `boot4/bootstrap4.batch`: scaling up
- `boot5/bootstrap5.batch`: integrating Rcpp code (requires file
  `boot_cpp.cpp`)
