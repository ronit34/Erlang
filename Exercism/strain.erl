-module(strain).
-export([test/3]).

test(List,Operation,Bool)->

    case Operation of
        keep ->
            case Bool of 
                true -> filter_even(List);
                false-> filter_odd(List)
            end;
        discard ->
            case Bool of
                true -> filter_odd(List);
                false -> filter_even(List)
            end
        end.


filter_even(List)->
    Fun = fun(X)-> X rem 2 == 0 end,
    lists:filter(Fun,List).
filter_odd(List)->
    Fun = fun(X) -> X rem 2 /= 0 end,
    lists:filter(Fun, List).