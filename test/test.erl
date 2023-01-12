-module(test).
-export([test/0,
test1/0,
palindrome/1,
splits_string/1,
mult/1,
duplicate/1,
list_to_tuples/0,
find_index2/2,
finds_elem_time/1,
find_index/2,
try1/1,
factors/1
]).
    
test()->
    List = [{c,3},{b,5},{a,2},{c,4},{c,1},{b,2},{c,4}],
    Fun = fun(X, Acc)->
        Key = element(1, X),
        Value = element(2, X),
        case proplists:get_value(Key, Acc) of
            undefined -> [{Key, Value}|Acc];
            New_Value     -> lists:keyreplace(Key, 1, Acc, {Key, Value + New_Value})
        end
    end,
    lists:foldl(Fun, [], List).

test1()->
    List = [[{b,3}],[{b,5}],[{a,2}],[{c,4}],[{c,1}],[{b,2},{c,4}]],
    Fun = fun(X, Acc)->
        Key = element(1, lists:nth(1,X)),
        Value = element(2, lists:nth(1,X)),
        case proplists:get_value(Key, Acc) of
            undefined -> [{Key, Value}|Acc];
            New_Value     -> lists:keyreplace(Key, 1, Acc, {Key, Value + New_Value})
        end
    end,
    lists:sort(lists:foldl(Fun, [], List)).

splits_string(String)->
    Fun = fun(X,Acc)->
        Acc ++ [[X]]
    end,
    lists:foldl(Fun, [], String).

palindrome(String)->
    A = splits_string(String),
    B = lists:nth(1, A),
    C = lists:last(A),
    case B == C of
        true-> palindromes;
        false-> not_palindrome
    end.

mult([{A,B},{C,D}])->
    E = A + B,
    F = A * B,
    case [{A,B},{E,F}] == [{A,B},{C,D}]of
        true ->true;
        false->false
    end.
    
duplicate(List)->
    A = lists:usort(List),
    B = List -- A,
    C = lists:usort(B),
    D = A ++ C,
    lists:sort(D).

list_to_tuples()->
    List = [1,2,3,4,5,6,7,8,9],
    list_to_tuples(List,[]).

list_to_tuples([],Acc)->Acc;
list_to_tuples([Last_Element],Acc)-> Acc ++ [{Last_Element}];
list_to_tuples([H1,H2|T],Acc)->list_to_tuples(T, Acc ++ [{H1,H2}]).


finds_elem_time(Elem)->
    List = [1,5,9,8,7,6,4,5,2,1,1,1],
    Fun = fun(X,Acc)->

        case X == Elem of
            true-> Acc + 1 ;
            false->Acc
        end
    end,
    lists:foldl(Fun, 0, List).

find_index2(List, Number)->
    find_index2(List, Number, 1).

find_index2([], Number, Index)->
    not_found;
find_index2([H|T], Number, Index)->
    case H == Number of
        true->
            Index;
        false->
            find_index2(T, Number, Index+1)
    end. 


find_index(List, Number)->
    Fun = fun(X, Acc)->
        case lists:nth(X, List)==Number of
            true-> Acc + X;
            false-> Acc
        end
    end,
    lists:foldl(Fun, 0, lists:seq(1, length(List))).



try1(List)->
    Fun = fun(X,Acc)->
        case lists:member(X, Acc) of
            true-> Acc;
            false-> [X|Acc]
        end
    end,

    lists:foldr(Fun, [], List).

factors(1) -> [];
factors(Value) -> 
    factors(Value, 2).
factors(Value, Value) -> 
    [Value];

factors(Value, Divisor) when Value rem Divisor =:= 0 -> 
    [Divisor | factors(Value div Divisor)];

factors(Value, Divisor) -> 
    factors(Value, Divisor+1).



