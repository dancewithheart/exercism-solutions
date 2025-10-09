-module(difference_of_squares).
-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).
-import(lists, [sum/1, map/2, seq/2]).

difference_of_squares(N) -> square_of_sum(N) - sum_of_squares(N).

square_of_sum(N) ->
  S = sum(seq(1,N)),
  S*S.

sum_of_squares(N) -> sum(map(fun(X)->X*X end, seq(1,N))).
