-module(case1).
-export([test/2,test1/2,test2/0,test3/0,
test4/0,test5/2
]).

test(A,B)->
    List = lists:seq(1,B),
    case lists:member(A,List) of
        true -> {found,A};
        false -> not_found
        end. 
    

test1(X,Y)->
    List = lists:seq(1,Y),
    lists:filter(fun(A) -> A == X end, List).

list()->
    [{a,3},{b,5},{a,2},{c,4},{c,1},{b,2},{a,4}].


test2()->
    List = list(),
    Fun = fun(X,Acc)->
        Key = element(1, X),
        Value = element(2, X),
        case proplists:get_value(Key, Acc) of
            undefined -> [{Key, Value}|Acc];
            New_Value     -> lists:keyreplace(Key, 1, Acc, {Key, Value + New_Value})
        end
    end,
    lists:foldl(Fun, [], List).

test3()->
    List =
        [
            [{delivered,1}],
            [{failed,2}],
            [{delivered,0}],
            [{failed,1}],
            [{delivered,6}],
            [{failed,0}]
        ],

    Fun = fun(X, Acc)->
        Key = element(1, lists:nth(1,X)),
        Value = element(2, lists:nth(1,X)),
        case proplists:get_value(Key, Acc) of
            undefined -> [{Key, Value}|Acc];
            New_Value     -> lists:keyreplace(Key, 1, Acc, {Key, Value + New_Value})
        end
    end,
    lists:sort(lists:foldl(Fun, [], List)).


test4()->
    List =
        [
            [{delivered,1},{failed,2}],
            [{delivered,0}],
            [{failed,1}],
            [{delivered,0},{failed,0}]
        ],

    List2 = lists:append(List),
    A = lists:sum(proplists:get_all_values(delivered, List2)),
    B = lists:sum(proplists:get_all_values(failed, List2)),
    [{delivered,A},{failed,B}].

test5(Elem,List)->
    A = lists:seq(1,length(List)),
    Tuple = lists:zip(List, A),
    proplists:get_value(Elem, Tuple).
    
