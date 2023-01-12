-module(filter_position_in_a_list).
-export([filter_odd_positions/1]).


filter_odd_positions(List)->
    case io:fread("", "~d") of
        eof ->
            lists:reverse(List);
        {ok,[T]}->
            filter_odd_positions([T|List]) 
    end.

filter([], _, Acc) -> lists:reverse(Acc);

filter([H|T], Index,Acc)->
    case Index rem 2 of
        1->
            filter(T,Index + 1, Acc);
        0->
            filter(T,Index + 1, [H|Acc])
    end.


main() ->
    Ans = filter_odd_positions([]),
    Ans1 = filter(Ans, 1, []),
    lists:map(fun(X) -> io:format("~p~n",[X]) end, Ans1).



% list()->
%     [8,15,22,1,10,6,2,18,18,1]. 

% filter_odd_positions(List)->
%     filter_odd_positions(List,1,[]).

% filter_odd_positions([],_,Acc)->
%     lists:reverse(Acc);

% filter_odd_positions([H|T], Index,Acc)->
%     case Index rem 2 of
%         1->
%             filter_odd_positions(T,Index + 1, Acc);
%         0->
%             filter_odd_positions(T,Index + 1, [H|Acc])
%     end.


