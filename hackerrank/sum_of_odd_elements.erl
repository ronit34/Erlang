-module(sum_of_odd_elements).
-export([sum_of_odd_elements/0]).


sum_of_odd_elements(List)->
    Fun = fun(X)->
        X rem 2 /= 0
    end,
    A = lists:filter(Fun,List),
    lists:sum(A).
    

input(Acc)->
    case io:fread("","~d") of
        eof ->
            lists:reverse(Acc);
        {ok,[T]}->
            input([T|Acc])
    end.

main() ->
    List = input([]),
    % io:format("========~p~n",[List]),
    Ans = sum_of_odd_elements(List),
    io:format("~p~n",[Ans])
    .