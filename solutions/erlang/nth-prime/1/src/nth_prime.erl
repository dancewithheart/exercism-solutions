-module(nth_prime).
-export([prime/1]).

prime(N) when N =< 0 -> erlang:error({error, "Argument have to be positive number - got " ++ integer_to_list(N)});
prime(1) -> 2;
prime(N) -> hd(primes(N, 5, [3,2])).

primes(N, K, Acc) ->
  case length(Acc) >= N of
    true -> Acc;
    false ->
      case lists:any(fun(X) -> X*X =< K andalso K rem X == 0 end, Acc) of
        true  -> primes(N, K+2, Acc);
        false -> primes(N, K+2, [K|Acc])
      end
  end.
