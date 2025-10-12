-module(accumulate).
-export([accumulate/2]).

%% apply fun F to each list item
-spec accumulate(fun((A) -> B), list(A)) -> list(B).
accumulate(_, [])    -> [];
accumulate(F, [H|T]) -> [F(H) | accumulate(F,T)].
