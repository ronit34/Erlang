-module(test1).
-export([delete/2,
droplast/1,
dropwhile/2,
enumerate/1,
filtermap/1
]).


% erlang book
% erlang BIF's
% 

delete(A,List) -> 
    lists:delete(A,List). %test1:delete(1,[1,2,3]).--> [2,3]

droplast(List) -> %test1:droplast([{a,1},{2,b}]).    -> [{a,1}]
    lists:droplast(List).

% dropwhile(List)->
%     Fun = fun(X)-> X rem 2 == 0 end,
%     lists:dropwhile(Fun, List).

dropwhile(A,List) -> 
    lists:dropwhile(A, List).

enumerate(List)->
    {List1,_} = lists:mapfoldl(fun(T,Acc)-> {{Acc, T}, Acc+1} end, 1, List),
    List1.

filtermap(List)->
    Fun = fun(X)->
        X rem 2 == 0 end,
    lists:filtermap(Fun, List).

