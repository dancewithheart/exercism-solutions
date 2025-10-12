-module(armstrong_numbers).
-export([is_armstrong_number/1]).
-import(lists, [map/2, sum/1]).

-spec(is_armstrong_number(integer()) -> boolean()).
is_armstrong_number(0) -> true;
is_armstrong_number(N) ->
  XS = digits(N),
  M = length(XS),
  sum(map(fun(D) -> math:pow(D, M) end, XS)) == N.

digits(N) when N < 10 -> [N];
digits(N) -> digits(N div 10) ++ [N rem 10].
