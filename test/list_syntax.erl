-module(list_syntax).
-export([list_all/1,
list_any/1,
list_append/0,
foldll/1
]).

list_all(List)->
    Pred = fun(X)-> X rem 2 == 0 end,
    lists:all(Pred,List).
% boolean 
list_any(List)->
    Pred = fun(X)-> X rem 2 == 0 end,
    lists:any(Pred,List).
% boolean
list_append()->
    List1 = [1,2,3,4,5],
    List2 = [6,7,8,9,0],
    lists:append(List1, List2).

foldll(List)->
    lists:foldl(fun(X,Y)-> Total = X * Y,
    io:format("X is~p~nY is~p~n Total is~p~n",[X,Y,Total]),Total end, 1, List).



