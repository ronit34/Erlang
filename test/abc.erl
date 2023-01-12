-module(abc). 
% -export([add/2,add/3,start/0]). 

% add(X,Y) -> 
%    Z = X+Y, 
%    io:fwrite("~w~n",[Z]). 
   
% add(X,Y,Z) -> 
%    A = X+Y+Z, 
%    io:fwrite("~w~n",[A]). 
 
% start() ->
%    add(5,6), 
%    add(5,6,6).

% ============================================================================
% -export([factorial/1]).

% factorial(N) when N > 1 ->
% 	N * factorial(N - 1);
% factorial(N) when N =< 1 ->
% 	1.

% ============================================================================
% -export([loop/1]).

% loop(N) when N =< 1000->
%     io:format("~w~n", [N]),
%     loop(N+1).

% ===========================================================================

% -export([celsius/1,fahenheit/1]).

% celsius(C) ->
% 	A = (C * 1.8) + 32,
% 	io:format("Celsius to fehrenheit = ~p~n",[A]).

% fahenheit(F)->
% 	A = (F - 32) * 5/9,
% 	io:format("Celsius to fehrenheit = ~p~n",[A]).

% ===========================================================================

% -export([convert/1]).

% convert({c,Num}) -> (Num * 1.8) + 32;
% convert({f,Num}) -> (Num - 32) * 5/9.

% ===========================================================================

% -export([test/1]).

% test(Model)->
%     Stock = [[{model,"Iphone"},{price,50000},{instock,20}],
%              [{model,"Samsung"},{price,40000},{instock,50}],
%              [{model,"Vivo"},{price,20000},{instock,100}]],
    
%     Product = fun([{model,M},{price,P},{instock,I}])->
%         case M == Model of
%             true->[{model,M},{price,P},{instock,I-1}];
%             false->[{model,M},{price,P},{instock,I}]
%         end
%     end,
%     lists:map(Product,Stock).

% =================================================================

-export([find/2,
phrase/1,
get_model/0,
total_cost/0,
get_price/1,
buy_mobile/1,
delete_stock/1,
duplicate/1
]).

find(Num, List)->
    case lists:member(Num, List) of
        true->{found, Num};
        false-> not_found
    end.


phrase(String)->
    List = string:split(String, " ", all),
    Fun = fun(X, Acc)->
        io:format("iteration : ~p~p~n",[X,Acc]),
        case proplists:get_value(X, Acc) of
            undefined-> [{X,1}|Acc];
                    _-> lists:keyreplace(X, 1, Acc, {X, proplists:get_value(X, Acc) + 1})
        end
    end,
    lists:foldl(Fun, [], List).

stock_list()->
    [
        [
            {model, "Iphone"},
            {price, 50000},
            {instock, 10}
        ],
        [
            {model,"Samsung"},
            {price, 30000},
            {instock, 20}
        ],
        [
            {model, "Vivo"},
            {price, 10000},
            {instock, 50}
        ]
    ].     
get_model()->
    List = stock_list(),
    A = lists:append(List),
    B = proplists:get_all_values(model, A),
    B.

total_cost()->
    List = stock_list(),
    A = lists:append(List),
    B = lists:sum(proplists:get_all_values(price, A)),
    C = lists:sum(proplists:get_all_values(instock, A)),
    D = B * C,
    D.

get_price(Price)->
    List = stock_list(),
    Fun = fun(X)->
        case proplists:get_value(model, X) == Price of
            true-> {true,proplists:get_value(price, X)};
            false-> false
        end
    end,
    lists:filtermap(Fun, List).

buy_mobile(Model)->
    List = stock_list(),
    Fun = fun(X)->
        case proplists:get_value(model, X) == Model of
            true->[{model,proplists:get_value(model, X)},{price,proplists:get_value(price, X)},{instock,proplists:get_value(instock, X) - 1}];
            false->[{model,proplists:get_value(model, X)},{price,proplists:get_value(price, X)},{instock,proplists:get_value(instock, X)}]
        end
    end,
    lists:map(Fun, List).


delete_stock(Model)->
    List = stock_list(),
    Fun = fun(X)->
        case proplists:get_value(model, X) =/= Model of
            true->true;
            false->false
        end
    end,
    lists:filter(Fun, List).

duplicate(List)->
    Fun = fun(X,Acc)->
        case proplists:get_value(X,Acc) of
            undefined->[{X,1}|Acc];
            Value    -> case Value<2 of
                            true->[{X,2}|Acc];
                            false->Acc 
                        end
        end
    end,
    A=lists:foldl(Fun,[],List),
    Key = fun(X)->
        element(1,X) end,
    B = lists:sort(lists:map(Key,A)),
    B.
