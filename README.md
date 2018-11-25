# rodyssey
Batch scripts to illustrate how to use Odyssey for R jobs

- `srun/boot.R`: interactive job
- `boot1/bootstrap1.sh`: vanilla bootstrap
- `boot2/bootstrap2.sh`: using `SLURM_ARRAY_TASK_ID`
- `boot3/bootstrap3.sh`: better formatting of the results
- `boot4/bootstrap4.sh`: scaling up
- `boot5/bootstrap5.sh`: integrating Rcpp code (requires file
  `boot_cpp.cpp`)
