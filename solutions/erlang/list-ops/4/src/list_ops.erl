-module(list_ops).
-compile({no_auto_import,[length/1]}).
-export([append/2, concat/1, filter/2, length/1, map/2, foldl/3, foldr/3,
	 reverse/1]).

append([],    XS)  -> XS;
append(XS,    [])  -> XS;
append([H|T], XS2) -> [H|append(T,XS2)].

concat([]) -> [];
concat([H|T]) -> append(H, concat(T)).

filter(_, []) -> [];
filter(F, [H|T]) ->
  case F(H) of
	true  -> [H | filter(F, T)];
	false -> filter(F, T)
  end.

length([]) -> 0;
length([_|T]) -> 1 + length(T).

map(_, []) -> [];
map(F, [H|T]) -> [F(H) | map(F,T)].

foldl(_, Start, []) -> Start;
foldl(F, Start, [H|T]) -> foldl(F, F(H,Start), T).

foldr(_, Start, []) -> Start;
foldr(F, Start, [H|T]) -> F(H, foldr(F, Start, T)).

reverse(XS) -> foldl(fun(X,Acc) -> [X|Acc] end, [], XS).
