/* vim: set expandtab shiftwidth=2 softtabstop=2 tw=70: */

#include <Rcpp.h>
using namespace Rcpp;

// Cross-reference work:
// 1. update ../src/registerDynamicSymbol.c with an item for this
// 2. main code should use the autogenerated wrapper in ../R/RcppExports.R
//
// [[Rcpp::export]]
IntegerVector do_gappy_index(IntegerVector starts, IntegerVector from, IntegerVector to)
{
    int nstarts = starts.size();
    int n = nstarts * (to[0] - from[0] + 1);
    int j = 0;
    IntegerVector res(n);
    for (int i = 0; i < nstarts; i++) {
        for (int fromto = from[0]; fromto <= to[0]; fromto++) {
            res[j++] = starts[i] + fromto;
        }
    }
    return res;
}
