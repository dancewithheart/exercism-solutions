-module(prime_factors).
-export([factors/1]).

factors(N) -> factors(N, 2, []).

factors(N, K, Acc) when K > N -> Acc;
factors(N, K, Acc) when N rem K == 0 -> factors(N div K, K, [K|Acc]);
factors(N, K, Acc) -> factors(N, K+1, Acc).
