-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).

add(E, []) -> [E];
add(E, [H|T]) when E < H -> [E,H|T];     % add preserve sort
add(E, [H|T]) when E == H -> [H|T];      % no duplicates
add(E, [H|T]) when E > H -> [H|add(E,T)].

contains(E, S) -> lists:member(E, S).

difference(XS, YS) -> XS -- YS.

disjoint([], _) -> true;
disjoint([H|T], XS) -> lists:all(fun(X) -> X /= H end, XS) and disjoint(T, XS).

empty(S) -> S == [].

% sorted so enough to check if elements are the same
equal(XS, YS) when XS == YS -> true;
equal(_, _) -> false.

from_list([]) -> [];
from_list([H|T]) -> add(H, from_list(T)).

intersection([], _) -> [];
intersection(_, []) -> [];
intersection([H|T], XS) ->
  case contains(H,XS) of
	true -> [H | intersection(T,XS) ];
	false -> intersection(T,XS)
  end.

subset([], _) -> true;
subset([H|T], YS) -> contains(H, YS) and subset(T,YS).

union(XS, []) -> XS;
union(XS, [H|T]) -> union(add(H, XS), T).
