-module(bob).
-export([response/1]).
-import(string, [to_upper/1, strip/1]).
-import(lists, [all/2, any/2, last/1, reverse/1, dropwhile/2]).

response(S) ->
  S2 = trim(S),
  Question = (length(S2) > 0) and (safeLast(S2) == $?),
  Yell = to_upper(S2) == S2,
  Silence = length(strip(S2)) == 0,
  HasAlpha = any(fun is_alpha/1, S2),
  mk_response(Question,Yell,Silence,HasAlpha).

mk_response(Question,Yell,_,HasAlpha) when HasAlpha and Question and Yell
  -> "Calm down, I know what I'm doing!";
mk_response(Question,_,_,_HasAlpha) when Question
  -> "Sure.";
mk_response(_,_,Silence,_HasAlpha)  when Silence
  -> "Fine. Be that way!";
mk_response(_,Yell,_,HasAlpha)      when HasAlpha and Yell
  -> "Whoa, chill out!";
mk_response(_,_,_,_) -> "Whatever.".

safeLast([]) -> false;
safeLast([_|T]) -> last(T).

trimFront(S) -> dropwhile(fun is_space/1, S).
trimBack(S) -> reverse(dropwhile(fun is_space/1, reverse(S))).
trim(S) -> trimFront(trimBack(S)).

is_space($\s) -> true;
is_space($\n) -> true;
is_space($\t) -> true;
is_space($\r) -> true;
is_space(_) -> false.

is_alpha(C) when C >= $a, C =< $z -> true;
is_alpha(C) when C >= $A, C =< $Z -> true;
is_alpha(_) -> false.
