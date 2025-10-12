-module(nth_prime).
-export([prime/1]).

prime(N) when N =< 0 -> erlang:error({error, "Argument have to be positive number - got " ++ integer_to_list(N)});
prime(1) -> 2;
prime(2) -> 3;
prime(N) -> hd(primes(N, 5, [3,2], 2)).

primes(N, _, Acc, AccLen) when AccLen >= N -> Acc;
primes(N, K, Acc, AccLen) ->
  case {is_prime(K, Acc), is_prime(K+2, Acc)} of % check only 6k-1 and
    {true,  true}  -> primes(N, K+6, [K+2,K|Acc], AccLen+2);
    {true,  false} -> primes(N, K+6, [K|Acc], AccLen+1);
    {false, true}  -> primes(N, K+6, [K+2|Acc], AccLen+1);
    {false, false} -> primes(N, K+6, Acc, AccLen)
  end.

is_prime(K, Primes) -> 
  not(lists:any(fun(X) -> X*X =< K andalso K rem X == 0 end, Primes)).
