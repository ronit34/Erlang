-module(one).
-export([zx/1,total/0]).


zx(Num)-> Num + 5. 

total()->
    List = [{1,2},{3,4}],
    total(List).
% {1,2},{3,4} -> total = 1 * 2 = 2
% 3*4 + total = 14

total([{What, N}|T]) -> What * N + total(T);
total([])-> 0.