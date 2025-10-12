-module(perfect_numbers).
-export([classify/1]).

classify(N) when N =< 0 -> erlang:error("Input is not positive integer");
classify(N) ->
  Divisors = [X || X <- lists:seq(1, N div 2), N rem X == 0],
  nicomachusClass(lists:sum(Divisors), N).

nicomachusClass(AliquotSum, AliquotSum) -> perfect;
nicomachusClass(AliquotSum, N) when AliquotSum > N -> abundant;
nicomachusClass(AliquotSum, N) when AliquotSum < N -> deficient.
