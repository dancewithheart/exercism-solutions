-module(collatz_conjecture).

-export([steps/1, collatz/1]).

%% input: positive integer, returns the number of steps it takes to reach 1
%% using Collatz Conjecture:
%% collatz(n) =
%%   n / 2    when n is even
%%   3*n +1   when n is odd
steps(N) -> length(collatz(N)).

collatz(N) when N < 1 -> erlang:error(badarg);
collatz(1) -> [];
collatz(N) when N rem 2 =:= 0 -> [N | collatz(N div 2)];
collatz(N) when N rem 2 =:= 1 -> [N | collatz(3*N + 1)].
