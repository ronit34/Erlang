-module(factorial).
-export([fact/1]).

fact(Num) when Num > 1->
%	io:format("Number = ~p X ~p~n",[Num,Num]),
	A = Num * fact(Num - 1),
	io:format("Number = ~p X ~p = ~p~n",[Num-1,Num,A]),
	A;
fact(Num) when Num =< 1 ->
	1.
