-module(phone_number).
-export([number/1, areacode/1, pretty_print/1]).
-import(string, [sub_string/3]).
-record(phone, {country_code, area_code, local_number }).

-type phone() :: #phone{
  country_code :: string(),
  area_code :: string(),
  local_number :: string()}.

number(S) ->
  case parse_phone(S) of
    error -> "0000000000";
    P -> P#phone.area_code ++ P#phone.local_number
  end.

areacode(S) -> (parse_phone(S))#phone.area_code.

-spec pretty_print(string()) -> string().
pretty_print(S) -> pretty_print_phone(parse_phone(S)).

-spec pretty_print_phone(phone()) -> string().
pretty_print_phone(#phone{area_code = AC, local_number = LN }) ->
  "(" ++ AC ++ ") " ++ sub_string(LN, 1, 3) ++ "-" ++ sub_string(LN,4, 7).
    
% North American Numberin Plan (NANP) used in USA, Canada, Bermuda
% international country code 1
% 3-digit area code (Numbering Plan Area code) NXX
% 7-digit local number NXX-XXXX
-spec parse_phone(string()) -> phone() | error.
parse_phone(S) -> parse_digits( lists:filter(fun is_digit/1, S) ).

is_digit(C) -> (C >= $0) andalso (C =< $9).

parse_digits([$1|T]) when length(T) == 10 -> phone(1, parse_area_and_local(T));
parse_digits(L) when length(L) == 10 -> phone("", parse_area_and_local(L));
parse_digits(_) -> error.

phone(CC,{AC,LN}) -> #phone{country_code = CC, area_code = AC, local_number = LN}.

parse_area_and_local(L) -> {sub_string(L, 1, 3), sub_string(L, 4, 10)}.

