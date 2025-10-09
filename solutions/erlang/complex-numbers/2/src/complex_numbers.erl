-module(complex_numbers).
-export([abs/1, add/2, conjugate/1, divide/2, equal/2, exp/1, imaginary/1, mul/2, new/2,
	 real/1, sub/2]).
-define(Precision, 0.00000001).

-record(complex, {re, im}).
-type(complex() :: #complex{re :: number(), im :: number()} ).

%% @doc new(a + bi) = {complex, a, b}
-spec new(number(), number()) -> complex().
new(Re, Im) -> #complex{re = Re, im = Im}.

%% @doc real(a + bi) = a
-spec real(complex()) -> number().
real(#complex{re=X}) -> X.

%% @doc imaginary(a + bi) = b
-spec imaginary(complex()) -> number().
imaginary(#complex{im=X}) -> X.

%% @doc compare two complex numbers with precision 0.00000001
-spec equal(complex(), complex()) -> boolean().
equal(#complex{re=Re1, im=Im1}, #complex{re=Re2, im=Im2}) when Re1 == Re2, Im1 == Im2 -> true;
equal(#complex{re=Re1, im=Im1}, #complex{re=Re2, im=Im2}) ->
  (erlang:abs(Re1 - Re2) < ?Precision) and (erlang:abs(Im1 - Im2) < ?Precision).

% unary operators

%% @doc abs(a + bi) = sqrt(a^2 + b^2)
-spec abs(complex()) -> float().
abs(#complex{re=Re, im=Im}) -> math:sqrt(Re*Re + Im*Im).

%% @doc conjugate(a + bi) = a - bi
-spec conjugate(complex()) -> complex().
conjugate(Z) -> Z#complex{im = -Z#complex.im}.

% binary operators

%% @doc (a + bi) + (c + di) = (a + c) + (b + d)i
-spec add(complex(),complex()) -> complex().
add(#complex{re=R1, im=I1}, #complex{re=R2, im=I2}) -> new(R1+R2, I1+I2).

%% @doc (a + bi)(c + di) = (ac - bd) + (bc + ad)i
-spec mul(complex(), complex()) -> complex().
mul(#complex{re=R1, im=I1}, #complex{re=R2, im=I2}) -> new(R1*R2 - I1*I2, R1*I2 + R2*I1).

%% @doc (a + bi) + (c + di) = (a - c) + (b - d)i
-spec sub(complex(), complex()) -> complex().
sub(#complex{re=R1, im=I1}, #complex{re=R2, im=I2}) -> new(R1-R2, I1-I2).

%% @doc (a + bi) / (c + di) = (ac + bd) / (c^2 + d^2) + (bc - ad) / (c^2 + d^2)i
-spec divide(complex(), complex()) -> complex().
divide(#complex{re=Re1, im=Im1}, #complex{re=Re2, im=Im2}) ->
  B = Re2*Re2 + Im2*Im2,
  new( (Re1*Re2 + Im1*Im2)/B, (Re2*Im1 - Re1*Im2)/B) .

%% @doc e^(a + bi) = e^a*e^(bi) = e^a(cos(b) + isin(b))
exp(#complex{re=A, im=B}) ->
  EA = math:exp(A),
  new(EA*math:cos(B), EA*math:sin(B)).

