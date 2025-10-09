-module(nth_prime).
-export([prime/1, primes/4]).

prime(N) when N =< 0 -> erlang:error({error, "Argument have to be positive number - got " ++ integer_to_list(N)});
prime(1) -> 2;
prime(2) -> 3;
prime(N) ->
  L = primes(N, 31, [29,23,19,17,13,11,7,5,3,2], 9),
  lists:nth(length(L) - N + 1, L).

primes(N, _, Acc, AccLen) when AccLen >= N -> Acc;
primes(N, K, Acc, AccLen) when N - AccLen >= 8 ->
  % check only 30m+N where N in [1,7,11,13,17,19,23,29]
  % so starting from 30m+1 = 31 = k it is
  % 30k+[0,6,10,12,16,18,22,28]
  XS = lists:map(fun(M) -> {K+M, is_prime(K+M, Acc)} end, [0,6,10,12,16,18,22,28]),
  YS = lists:foldl(fun({M, true}, Bcc) -> [M|Bcc]; ({_,_}, Bcc) -> Bcc end, [], XS),
  primes(N, K+30, YS ++ Acc, AccLen + length(YS));
primes(N, K, Acc, AccLen) ->
  % check only 6m+1 and 6m+5
  % so starting from 6m+1 = 7 = 6 + 1 = k it is 6k and (6k+1)+4
  case {is_prime(K, Acc), is_prime(K+4, Acc)} of 
    {true,  true}  -> primes(N, K+6, [K+4,K|Acc], AccLen+2);
    {true,  false} -> primes(N, K+6, [K|Acc], AccLen+1);
    {false, true}  -> primes(N, K+6, [K+4|Acc], AccLen+1);
    {false, false} -> primes(N, K+6, Acc, AccLen)
  end.

is_prime(K, Primes) ->
  not(lists:any(fun(X) -> X*X =< K andalso K rem X == 0 end, Primes)).
