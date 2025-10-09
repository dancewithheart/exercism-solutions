-module(gigasecond).
-export([from/1]).
-import(calendar, [datetime_to_gregorian_seconds/1, gregorian_seconds_to_datetime/1]).

from({{Year,Month,Dat},{Hour,Min,Sec}}) ->
  gregorian_seconds_to_datetime(1000000000 + datetime_to_gregorian_seconds({{Year,Month,Dat},{Hour,Min,Sec}}));
from({Year,Month,Dat}) -> from({{Year,Month,Dat},{0,0,0}}).
