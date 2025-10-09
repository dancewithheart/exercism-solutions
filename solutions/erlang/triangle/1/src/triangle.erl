-module(triangle).
-export([kind/3]).

kind(A, B, C) when A*B*C == 0
  -> {error, "all side lengths must be positive"};
kind(A, B, C) when A + B =< C; A + C =< B; B + C =< A
  -> {error, "side lengths violate triangle inequality"};
kind(A, A, A) -> equilateral;
kind(A, B, C) when A == B; A == C; B == C -> isosceles;
kind(_,_,_) -> scalene.
