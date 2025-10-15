-module(grains).
-export([square/1, total/0]).

pow2(N) -> trunc(math:pow(2,N)).

square(N) when N < 1; N > 64 ->
  {error, "square must be between 1 and 64"};
square(N) -> pow2(N-1).

total() -> pow2(64)-1.
