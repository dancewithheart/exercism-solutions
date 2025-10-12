-module(darts).
-export([score/2]).

score(X, Y) when X*X + Y*Y =< 1     -> 10;
score(X, Y) when X*X + Y*Y =< 5*5   -> 5;
score(X, Y) when X*X + Y*Y =< 10*10 -> 1;
score(_,_) -> 0.
