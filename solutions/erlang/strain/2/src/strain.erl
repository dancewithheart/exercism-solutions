-module(strain).
-export([keep/2, discard/2]).

keep(F, XS) -> [X || X <- XS, F(X)].

discard(F, L) -> keep(fun(X) -> not F(X) end, L).
