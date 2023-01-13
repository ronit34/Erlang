-module(reverse_a_list).
-export([reverselist/0]).

reverselist(List)->
    % List = [19,22,3,28,26,17,18,4,28,0],

    lists:reverse(List).

input(Acc)->
    case io:fread("","~d") of
        eof ->
            lists:reverse(Acc);
        {ok,[T]}->
            input([T|Acc])
    end.
main() ->
    List = input([]),
    
    List1 = reverselist(List),
    lists:map(fun(X)->io:format("~p~n",[X]) end, List1)
	.