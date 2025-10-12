-module(rational_numbers).
-export([absolute/1, add/2, divide/2, exp/2, mul/2, reduce/1, sub/2, gcd/2]).

absolute({A, B}) -> reduce({abs(A),abs(B)}).

add({A1,B1}, {A2,B2}) ->
 reduce({A1*B2 + A2*B1, B1*B2}).

divide({A1,B1}, {A2,B2}) -> reduce({A1*B2, B1*A2}).

exp(B, {E1,E2}) -> math:pow(math:pow(B,E1),1/E2);
exp({B1,B2}, E) when E < 0 -> exp({B2,B1},-E);
exp({B1,B2}, E) -> reduce({round(math:pow(B1,E)),round(math:pow(B2,E))}).

mul({A1,B1}, {A2,B2}) -> reduce({A1*A2, B1*B2}).

reduce({A,B}) ->
  G = gcd(abs(A),abs(B)),
  set_sign({A div G,B div G}).
set_sign({A,B}) when A > 0, B < 0 -> {-A,-B};
set_sign({A,B}) when A < 0, B < 0 -> {-A,-B};
set_sign(R) -> R.

gcd(A,A) -> A;
gcd(A,0) -> A;
gcd(A,B) when A > B -> gcd(B, A rem B);
gcd(A,B) -> gcd(B,A).

sub({A1,B1}, {A2,B2}) -> reduce({A1*B2 - A2*B1, B1*B2}).
