-module(two_fer).
-export([twofer/0,twofer/1]).

twofer(Name)-> 
	io:format("One for ~p, one for me.~n",[Name]).
twofer()->
	io:format("One for you, One for me.~n").

