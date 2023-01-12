-module(hamming).
-export([test/2, test1/2]).

test(St1,St2)->
    A=lists:zip(St1,St2),
    Fun = fun(X,Acc)->
        Key = element(1, X),
        Value = element(2, X),
        case Key==Value of
            true->Acc;
            false->Acc+1 
        end
    end,
    lists:foldl(Fun,0,A).


test1(Str1, Str2)->
    test1(Str1, Str2, 0).

test1([], [], Count)->
    Count;
test1([H|T], [H2|T2], Count)->
    case H == H2 of
        true->
            test1(T, T2, Count);
        false->
            test1(T, T2, Count+1)
    end.
