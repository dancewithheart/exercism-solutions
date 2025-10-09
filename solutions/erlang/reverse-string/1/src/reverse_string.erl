-module(reverse_string).
-export([reverse/1]).

reverse(XS) -> reverse(XS, []).

reverse([], Acc) -> Acc;
reverse([A], Acc) -> [A|Acc];
reverse([A,B], Acc) -> [B,A|Acc];
reverse([A,B,C], Acc) -> [C,B,A|Acc];
reverse([A,B,C,D | XS], Acc) -> reverse(XS, [D,C,B,A|Acc]).
