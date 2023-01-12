% -module(solution).
% -export([main/0]).

% list_array(Delimiter,List)->
%     % List = [3,10,9,8,2,7,5,1,3,0],
%     io:format("==============================~p~p~n",[Delimiter,List]),
%     Fun = fun(X,Acc)-> 
%         case X < Delimiter of
%             true -> lists:append(Acc,[X]);
%             false->Acc

%         end
%     end,
%     lists:foldl(Fun,[],List).


% input(Acc) ->
%     case io:fread("", "~d") of
%         eof ->
%             lists:reverse(Acc);
%         {ok, [T]} ->
%             input([T|Acc])
%     end.

% main() ->
%     {ok,X}=io:fread("", "~d"),
%     List = input([]), 
%     io:format("+++++++++++++++++++++~p~n",[X]),
%     io:format("==============================~p~n",[List]),
%     list_array(X,List).


% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(solution).
-export([main/0]).

list_array(List)->
    Elem = lists:nth(1,List),
    NewList = lists:delete(Elem,List),
    Fun = fun(X,Acc)-> 
        case X < Elem of
            true ->Acc ++ [X];
            false->Acc

        end

    end,
    lists:foldl(Fun,[],NewList).


input(Acc) ->
    case io:fread("", "~d") of
        eof ->
            lists:reverse(Acc);
        {ok, [T]} ->
            input([T|Acc])
    end.

main() ->
    List = input([]), 
    list_array(List).