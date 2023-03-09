-module(update_list).
-export([update/0]).

update(List)->
    % List = [2 ,-4, 3, -1, 23, -4, -54],
    Fun = fun(X)->
        case X =< 0 of
            true-> A = [] ++ [-X],lists:append(A);
            false-> A = [] ++ [X],lists:append(A)
        end
    end,
    lists:map(Fun,List).

input(Acc)->
    case io:fread("","~d") of
        eof->
            lists:reverse(Acc);
        {ok,[T]}->
            input([T|Acc]) end.
main() ->
    List = input([]),
    Ans = update(List),
    lists:map(fun(X)->io:format("~p~n",[X]) end, Ans)
	.
