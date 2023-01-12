-module(shop1).
-export([total/0]).

total()->
    List = [{1,2},{3,4}],
    total(List).
% {1,2},{3,4} -> total = 1 * 2 = 2
% 3*4 + total = 14

total([{What, N}|T]) -> What * N + total(T);
total([])-> 0.


