-module(square_root).

-export([square_root/1]).

square_root(1) -> 1;
square_root(N) -> newton(N, N div 2).

newton(N, K) when (K*K =< N), (K + 1)*(K + 1) > N -> K;
newton(N, K) -> newton(N, (K + (N div K)) div 2).
