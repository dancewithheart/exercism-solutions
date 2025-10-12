-module(raindrops).

-export([convert/1, accPling/4, resOrInputStr/2]).

convert(N) ->
    Res = lists:foldl(
        fun({M,Str}, Acc) -> accPling(N,M,Acc,Str) end,
        "",
        [{3,"Pling"}, {5, "Plang"}, {7, "Plong"}]),
    resOrInputStr(Res,N).

accPling(N,M,Acc,Str) when N rem M =:= 0 -> Acc ++ Str;
accPling(_,_,Acc,_) -> Acc.

resOrInputStr(Res, _) when length(Res) > 0 -> Res;
resOrInputStr(_,   N) -> integer_to_list(N).
