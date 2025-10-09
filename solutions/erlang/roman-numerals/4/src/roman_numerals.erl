-module(roman_numerals).
-export([roman/1]).

roman(N) -> roman(N, "", expand([{"M", 1000}, {"D", 500}, {"C", 100}, {"L", 50}, {"X", 10}, {"V", 5}, {"I", 1}])).

roman(0, Acc, _) -> Acc;
roman(N, Acc, [{S,M}|T]) when N >= M -> roman(N rem M, Acc ++ repeat(N div M, S), T);
roman(N, Acc, [_|T]) -> roman(N, Acc, T).

repeat(N,X) -> lists:flatten(lists:duplicate(N, X)).

% it would be faster to just expand - but
% it is interesting recursion pattern - handle 3 elements at the time, and push back last
expand([{X,N}, {V,N5}, {I,N1}|T]) -> [{X,N}, {I++X, N-N1}, {V,N5}, {I++V, N5-N1}] ++ expand([{I,N1}|T]);
expand([{C1,N1}]) -> [{C1,N1}].
