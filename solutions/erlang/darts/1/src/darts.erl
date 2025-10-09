-module(darts).
-export([score/2]).
-import(math, [sqrt/1]).

score(X, Y) -> scoreDistance(distance(X,Y)).

distance(X,Y) -> sqrt(X*X + Y*Y).

scoreDistance(X) when X =< 1  -> 10;
scoreDistance(X) when X =< 5  -> 5;
scoreDistance(X) when X =< 10 -> 1;
scoreDistance(_) -> 0.
