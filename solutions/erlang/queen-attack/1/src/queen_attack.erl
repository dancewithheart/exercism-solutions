-module(queen_attack).
-export([can_attack/2]).

can_attack({Wa,Wn}, {Ba,Bn}) ->
  (Wn == Bn) or (Wa == Ba) or (Wa-Wn == Ba-Bn) or (Wa+Wn == Ba+Bn).
