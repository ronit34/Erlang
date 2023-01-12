-module(list_replica).
-export([main/0]).

listreplica(List)->
    % List = [5,1,2,3,4],
    Elem = lists:nth(1,List),   % 5
    NewList = lists:delete(Elem,List), % [1,2,3,4]

    Fun = fun(X)->
        Number = lists:seq(1,Elem),
        Fun1 = fun(_)->
            A = X,
            io:format("~p~n",[A])
        end,
        lists:foreach(Fun1,Number)

    end,
    lists:foreach(Fun,NewList).

% ==================================================================
input(Acc) ->
    case io:fread("", "~d") of
        eof ->
            lists:reverse(Acc);
        {ok, [T]} ->
            input([T|Acc])
    end.

main() ->
    {ok,Acc} = io:fread("","~d"),
    List = input(Acc),
    listreplica(List)
	.
