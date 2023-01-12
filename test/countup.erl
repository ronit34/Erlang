-module(countup).
-export([count/1]).

count(Limit) ->
    count(1, Limit).

count(Count, Limit) when Count =< Limit ->
    io:format(" Count up number = ~p~n", [Count]),
    timer:sleep(1000),
    count(Count+1, Limit);

count(Count, Limit) ->
    io:format(" Finished.~n").





