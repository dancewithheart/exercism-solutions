-module(perfect_numbers).
-export([classify/1]).
-import(lists, [seq/2, sum/1]).

classify(N) when N =< 0 -> erlang:error("Input is not positive integer");
classify(N) ->
  Divisors = [X || X <- lists:seq(1, N div 2), N rem X == 0],
  nicomachusClass(sum(Divisors), N).

nicomachusClass(AliquotSum, N) when AliquotSum > N -> abundant;
nicomachusClass(AliquotSum, N) when AliquotSum < N -> deficient;
nicomachusClass(AliquotSum, N) when AliquotSum == N -> perfect.
