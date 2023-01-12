-module(series).
-export([test/2,test1/0]).

test(String,Number)->
    test(String, Number, []).

test([], _, Acc)->
    Acc;

test([H|Rest], Number, Acc)->
    Slice = lists:sublist([H|Rest], Number),
    io:format(" ~p~n",[length(Slice)]),
    case length(Slice) of
        Number -> test(Rest, Number, Acc ++ [Slice]);
        _      -> test([], Number, Acc)
    end.




test1()->
    List = "abcabcdabcde",
    Fun = fun(X,Acc)->
        % io:format(" ~p~n",[X]),
        case proplists:get_value([X], Acc) of
            undefined-> [{[X],1}|Acc];
            Value     -> lists:keyreplace([X], 1, Acc, {[X], Value+1})

        end
    end,
    lists:foldl(Fun, [], List).
    
    
