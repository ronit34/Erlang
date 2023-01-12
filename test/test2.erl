-module(test2).
-export([test/0,sort_list_by_length/0,re_try/0]).

test()->
    List = [1,2,3,4,5,6,7,6,5,4,3,2,1,7,8,5,4,3,4,5,6,6,6,6,6,6,6,6,6,6],
    % duplicate number with 2 copies
    % Fun = fun(X,Acc)->
    %     case proplists:get_value(X,Acc) of
    %         undefined->[{X,1}|Acc];
    %         Value    -> case Value<2 of
    %                         true->[{X,2}|Acc];
    %                         false->Acc 
    %                     end
    %     end
    % end,
    % A=lists:foldl(Fun,[],List),
    % Key = fun(X)->
    %     element(1,X) end,
    % B = lists:sort(lists:map(Key,A)),
    % B.

% duplicate
    % Fun = fun(X,Acc)->
    %     case lists:member(X, Acc) of
    %         true->Acc;
    %            _->[X|Acc]
    %     end
    % end,
    % A = lists:foldl(Fun, [], List),
    % lists:reverse(A).


% Input = [1,2,3,4,5,6,7,6,5,4,3,2,1,7,8,5,4,3,4,5,6,6,6,6,6,6,6,6,6,6]
% Output = [{6,12}]
    NewList = test1(List),
    Max = test2(NewList),
    test3(NewList, Max).

test1(List)->
    Fun = fun(X,Acc)->
        case proplists:get_value(X, Acc) of
            undefined -> [{X,1}|Acc];
            Value     -> lists:keyreplace(X, 1, Acc, {X,Value+1})
        end
    end,
    List2 = lists:foldl(Fun,[],List),
    List2.

test2(List)->
    Fun2 = fun({_,Value},Acc)->
        [Value] ++ Acc
    end,
    List3 = lists:foldl(Fun2, [], List),
    List3_max = lists:max(List3),
    List3_max.

test3(List,Max)->
    Fun3 = fun({Key,Value},Acc)->
        case (Value == Max) of
            true-> [{Key,Value}] ++ Acc;
            false-> Acc
        end
    end,   
    lists:foldl(Fun3, [], List).


sort_list_by_length()->
    List = [[2], [0], [1, 3], [0, 7], [9, 11], [13, 15, 17]],
    Fun = fun(X,Acc)->
        Index_one = length(X),
        io:format("==~p~n",[Index_one]),
        case Index_one of
            1 -> lists:sort([X|Acc]);
            _-> Acc
        end

    end,
    A = lists:foldl(Fun, [], List),

    Fun2 = fun(X,Acc)->
        Index_one = length(X),
        io:format("==~p~n",[Index_one]),
        case Index_one of
            2 -> lists:sort([X|Acc]);
            _-> Acc
        end

    end,
    B = lists:foldl(Fun2, [], List),

    Fun3 = fun(X,Acc)->
        Index_one = length(X),
        io:format("==~p~n",[Index_one]),
        case Index_one of
            3 -> lists:sort([X|Acc]);
            _-> Acc
        end

    end,
    C = lists:foldl(Fun3, [], List),
    lists:append([A,B,C]).

re_try()->
    String = "That's the password: 'PASSWORD 123'!",

    Re1 = re:replace(String,":" , "",[{return,list}]),
    Re2 = re:replace(Re1,"!" , "",[{return,list}]),
    Re3 = re:replace(Re2,"'PASSWORD 123'" , "PASSWORD 123",[{return,list}]),
    List = string:lowercase(Re3),
    FList = string:split(List, " ", all),
    
    Fun = fun(X, Acc)->
        % io:format("iteration : ~p~p~n",[X,Acc]),
        case proplists:get_value(X, Acc) of
            undefined-> [{X,1}|Acc];
                    _-> lists:keyreplace(X, 1, Acc, {X, proplists:get_value(X, Acc) + 1})
        end
    end,
    lists:foldl(Fun, [], FList).