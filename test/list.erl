-module(list).
% -export([a/2,aa/1,aaa/1,test/1,test1/1,new/1,test2/1]).

% a(List,List2)->
% 	Fun = fun(X) -> {X,List2,List2 * X} end,
% 	lists:map(Fun,List).

% aa(X)-> 
% 	Fun = fun(X)->
% 		case X rem 2 of 
%             true -> {X, even};
%             false -> {X, odd} end end,
% 		lists:map(Fun,X).

% aaa(List)-> 
% 	Fun = fun(X)->
% 		{X,lists:sum(lists:seq(1,X))} end,
% 		lists:map(Fun,List).


% test(List)->
%     Fun = fun(X) ->
%         X * 0 end,
%     lists:map(Fun,List).

% test1(List)->
%     lists:sum(List).

% new(List) -> % [1,2,3,4,5] -> 1 * 1 = 1 -> 2 * 1 = 2 -> 3*2 -> 6 -> 4*6 -> 24 -> 5 * 24 -> 120
%     lists:foldl(fun(X,Sum) -> X * Sum end, 1,List). % (1,)

-export([
test2/1,
test3/1,
test4/1,
foldrr/1
]).
test2(A)->
    Div3 = (A rem 3 == 0),
    Div5 = (A rem 5 == 0),
    case {Div3,Div5} of
        {true,true}-> divisible;
        {true,false}-> divisible;
        {false,true}-> divisible;
                    _-> cant_be_devided
    end.

test3(List)->
    Fun = fun(X)->
        case X rem 3 == 0 of
            true -> fizz;
            _-> case X rem 5 == 0 of
                    true -> buzz;
                    _-> case X rem 15 ==0 of
                            true -> fizzbuzz;
                            _->X
                        end
                end
        end
    end,
    lists:map(Fun,List).


test4(List)->
    A = even_list(List),
    B = odd_list(List),
    _Find = [[A],[B]],
    Sum = [[lists:sum(A)],[lists:sum(B)]],
    Sum.

even_list(List)->
    Fun = fun(X)-> 
        X rem 2 == 0 end,
    lists:filter(Fun,List).
odd_list(List)->
    Fun = fun(X)-> 
        X rem 2 /= 0 end,
    lists:filter(Fun,List).


foldrr(List)->
    Fun = fun(X,Acc)-> 
        case X rem 2==0 of
            true-> [X] ++ Acc;
            false->Acc end
        end,
        lists:foldr(Fun,[],List).