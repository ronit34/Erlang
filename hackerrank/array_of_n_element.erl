-module(array_of_n_element).
-export([element/0]).


main() ->
    {ok, [N]} = io:fread("", "~d"),

    % Fill in the blank with your code creating a list of N integers  
    List = lists:seq(1,N),
    % Do not change any of the other lines of code.

    io:format("~w~n", [List]).
