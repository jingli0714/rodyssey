// [[Rcpp::depends(RcppArmadillo)]]
#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace arma;

uvec getidx(int nrows) {
  IntegerVector frame = seq_len(nrows);
  IntegerVector draw(nrows) ;
  draw = sample(frame, nrows, TRUE) ;
  uvec idx = as<uvec>(draw) - 1;
  return(idx);
}

// [[Rcpp::export]]
mat boot_cpp(int nrep, mat x, vec y) {
  
  mat b;
  mat xidx(x.n_rows, x.n_cols);
  vec yidx(x.n_rows);
  vec bidx(x.n_cols);
  
  for (int i=1; i < nrep + 1; i++) {
    uvec idx = getidx(x.n_rows);
    xidx = x.rows(idx); yidx = y.rows(idx);
    bidx = (xidx.t() * xidx).i() * xidx.t() * yidx;
    b = join_cols(b, bidx.t());
  }
  return(b);
}

/*** R
x <- as.matrix(cbind(1, mtcars$wt, mtcars$hp))
y <- mtcars$mpg
b <- boot_cpp(10000, x, y)
head(b)
*/
