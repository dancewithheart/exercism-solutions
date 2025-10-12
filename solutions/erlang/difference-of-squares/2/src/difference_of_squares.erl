-module(difference_of_squares).
-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).

difference_of_squares(N) -> square_of_sum(N) - sum_of_squares(N).

% 1 + 2 + 3 + .. + n = n*(n+1)/2
% n / 2 is same like right shift 1
square_of_sum(N) ->
    S = N*(N+1) bsr 1,
    S*S.

sum_of_squares(N) -> N*(N+1)*(2*N+1) div 6.
