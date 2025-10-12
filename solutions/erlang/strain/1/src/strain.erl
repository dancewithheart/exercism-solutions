-module(strain).

-export([keep/2, discard/2]).

keep(_, []) -> [];
keep(F, [H|T]) ->
  case F(H) of
    true -> [H|keep(F, T)];
    false -> keep(F, T)
  end.

discard(F, L) ->
  keep(fun(X) -> not F(X) end, L).
