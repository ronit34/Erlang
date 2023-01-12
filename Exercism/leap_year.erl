-module(leap_year).
-export([leap/1]).

leap(Year) when Year rem 4 == 0,Year rem 100 > 0 ->
	true;
leap(Year) when Year rem 400 == 0->
	true;
leap(Year) ->
	false.

