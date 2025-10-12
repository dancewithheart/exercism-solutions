-module(hamming).
-export([distance/2]).

distance(XS,YS) when length(XS) /= length(YS) -> {error, badarg};
distance([], []) -> 0;
distance([X|XS], [Y|YS]) when X /= Y -> 1 + distance(XS,YS);
distance([X|XS], [Y|YS]) when X == Y -> distance(XS,YS).
