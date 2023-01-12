-module(collactz).
-export([collactz/1]).

collactz(Num)->
    collactz(0, Num).


collactz(Count, Num) when Num == 1 ->
    io:format("The step need to reach 1 is = ~p~n",[Count]);

collactz(Count, Num) when Num rem 2 == 0 ->
    io:format("Divide = ~p~n",[Num]),
    collactz(Count+1,Num div 2);

collactz(Count,Num) when Num rem 2 /= 0 ->
    io:format("Multiply = ~p~n",[Num]),
    collactz(Count+1, 3 * Num + 1).