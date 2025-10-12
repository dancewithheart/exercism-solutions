-module(simple_linked_list).
-export([cons/2, count/1, empty/0, from_native_list/1,
     head/1, reverse/1, tail/1, to_native_list/1]).


empty() -> {emptyLinkedList}.

cons(X, XS) -> {X, XS}.

head({emptyLinkedList}) -> erlan:error(error, "Call head on empty list");
head({X, _}) -> X.

tail({emptyLinkedList}) -> erlan:error(error, "Call tail on empty list");
tail({_, XS}) -> XS.

reverse(LL) -> from_native_list(lists:reverse(to_native_list(LL))).

count({emptyLinkedList}) -> 0;
count({_,XS}) -> 1 + count(XS).

to_native_list({emptyLinkedList}) -> [];
to_native_list({X, XS}) -> [X | to_native_list(XS)].

from_native_list([]) -> empty();
from_native_list([H|T]) -> cons(H, from_native_list(T)).
