-module(darts).
-export([test/1]).

test({X,Y}) when (X >= 0) and (X =< 1) and (Y >= 0) and (Y =< 1) -> "10 points";
test({X,Y}) when (X >= 2) and (X =< 5) and (Y >= 2) and (Y =< 5) -> "5 points";
test({X,Y}) when (X >= 6) and (X =< 10) and (Y >= 6) and (Y =< 10) -> "1 points";
test({_,_})-> "0 points".
