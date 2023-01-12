-module(word_count).
-export([word/0]).

word()->
    String = ["That's the password: 'PASSWORD 123'!", " cried the Special Agent. \nSo I fled,"],
    % String = "That's the password: 'PASSWORD 123'!",

    Re1 = re:replace(String,":" , "",[{return,list}]),
    Re2 = re:replace(Re1,"!" , "",[{return,list}]),
    Re3 = re:replace(Re2,"'PASSWORD 123'" , "PASSWORD 123",[{return,list}]),
    Re4 = re:replace(Re3, "\n", "",[{return,list}]),
    List = string:lowercase(Re4),
    FList = string:split(List, " ", all),
    
    Fun = fun(X, Acc)->
        % io:format("iteration : ~p~p~n",[X,Acc]),
        case proplists:get_value(X, Acc) of
            undefined-> [{X,1}|Acc];
                    _-> lists:keyreplace(X, 1, Acc, {X, proplists:get_value(X, Acc) + 1})
        end
    end,
    lists:foldl(Fun, [], FList).
