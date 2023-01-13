-module(list_length).
-export([list_length/0]).


list_length(List)->
    Fun = fun(X,Acc)->
        case proplists:get_value(X, Acc) of
            undefined-> [1|Acc];
            _        -> Acc

        end
    end,
    lists:sum(lists:foldl(Fun, [], List)).

input(Acc)->
    case io:fread("","~d") of
        eof ->
            lists:reverse(Acc);
        {ok,[T]}->
            input([T|Acc])
    end.
main() ->
    List = input([]),
    % io:format("====~p~n",[List]),
    A = list_length(List),
    io:format("~p~n",[A])
	.