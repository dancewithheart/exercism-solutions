-module(isogram).

-export([is_isogram/1]).

is_isogram(S) -> is_isogram2(string:lowercase(S)).

is_isogram2([]) -> true;
is_isogram2([H|T]) when H < $a; H > $z -> is_isogram2(T);
is_isogram2([H|T]) ->
  case lists:member(H,T) of
    true -> false;
    false -> is_isogram2(T)
  end.

