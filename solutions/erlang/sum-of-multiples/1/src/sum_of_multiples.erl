-module(sum_of_multiples).
-export([sum/2]).
-import(lists, [seq/3, uniq/1]).

sum(Factors, Limit) -> lists:sum(uniq([X || Y <- Factors, Y > 0, X <- seq(Y, Limit-1, Y)])).
