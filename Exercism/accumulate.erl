-module(accumulate).
-export([acc/1]).

acc(A)->
	Fun = fun(X)-> X*X end, 
	lists:map(Fun,A).