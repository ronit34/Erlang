-module(recursion).
-export([countdown/1,
duplicate_by_recursion/1,
len/1,
test/0,
name_mark/0,
scholarships/0,
diff/0,
marks_fees/0,
roman/1
]).

countdown(From) when From == 0 -> 1;

countdown(From) when From > 0 ->
  Total = From * countdown(From-1),
  io:format("Number : ~p~n",[Total]),
  timer:sleep(1000),
  Total.

% countdown(From) ->
% 	io:format("Countdown Completed~n").



duplicate_by_recursion(List)->
  duplicate_by_recursion(List,[]).

duplicate_by_recursion([], Acc)->
  Acc;

duplicate_by_recursion([H | T], Acc)->
  case lists:member(H, Acc) of
    true -> duplicate_by_recursion(T, Acc);
    false-> duplicate_by_recursion(T, Acc ++ [H])
  end.




len([]) -> 0; 
len([_|T]) -> 1 + len(T).



test()->
  [
  [
      {name, "anil"},
      {marks, 40},
      {subject, maths},
      {details, [
          {scholarship, no},
          {fees, unpaid}
      ]}
  ],
  [
      {name, "sunil"},
      {marks, 60},
      {subject, maths},
      {details, [
          {scholarship, no},
          {fees, unpaid}
      ]}
  ],
  [
      {name, "akash"},
      {marks, 80},
      {subject, english},
      {details, [
          {scholarship, yes},
          {fees, paid}
      ]}
  ],
  [
      {name, "ram"},
      {marks, 34},
      {subject, geography},
      {details, [
          {scholarship, no},
          {fees, unpaid}
      ]}
  ],
  [
      {name, "manoj"},
      {marks, 90},
      {subject, maths},
      {details, [
          {scholarship, yes},
          {fees, unpaid}
      ]}
  ]
  ].

name_mark()->
  List = test(),
  name_mark(List,[]).


name_mark([],Acc)->
  Acc;

name_mark([X | T], Acc)->
  A = proplists:get_value(details, X),
  B = (proplists:get_value(scholarship,A) == yes),
  C = [{proplists:get_value(name, X), proplists:get_value(marks, X)}],
  case B of 
    true ->name_mark(T, Acc ++ C);
    false->name_mark(T,Acc)
  end. 

scholarships()->
  List = test(),
  scholarships(List,[]).

scholarships([], Acc)->
  Acc;

scholarships([H | T], Acc)->
  A = proplists:get_value(details, H),
  B = (proplists:get_value(scholarship, A) == yes),
  % C = (proplists:get_value(scholarship, A) == no),
  D = proplists:get_value(name, H),
  E = proplists:get_value(marks, H),
  F = {D,E},
  case B of
    true->scholarships(T,Acc ++ [F]);
    false->scholarships(T,Acc)
  end.

diff()->
  List = test(),
  Fun = fun(X,Acc) ->
    Details = proplists:get_value(details, X),
    case proplists:get_value(scholarship, Details) of
      yes ->
        case proplists:get_value(scholarship, Acc) of
          undefined   ->  [{scholarship,[[{name, proplists:get_value(name, X)},{marks, proplists:get_value(marks, X)}]]} | Acc];
          Value       ->  lists:keyreplace(scholarship, 1, Acc, {scholarship, Value ++ [[{name, proplists:get_value(name, X)},{marks, proplists:get_value(marks, X)}]]})
        end;
      no ->
        case proplists:get_value(non_scholarship, Acc) of
          undefined ->[{non_scholarship,[[{name, proplists:get_value(name, X)},{marks, proplists:get_value(marks, X)}]]} | Acc];
          Value    ->lists:keyreplace(non_scholarship, 1, Acc, {non_scholarship, Value ++ [[{name, proplists:get_value(name, X)},{marks, proplists:get_value(marks, X)}]]})
        end
    end
  end,    
  lists:foldl(Fun, [], List).

% Write a function to create a list for marks > 50 return name and fees ?

marks_fees()->
  List = test(),
  Fun = fun(X,Acc)->
  Details = proplists:get_value(details, X),
    case proplists:get_value(marks, X) > 50 of
      true-> 
        case proplists:get_value(greater_than, Acc) of
          undefined -> [{greater_than, [[{name, proplists:get_value(name, X)},{fees, proplists:get_value(fees, Details)}]]} | Acc];
          Value     -> lists:keyreplace(greater_than, 1, Acc, {greater_than, Value ++ [[{name, proplists:get_value(name, X)},{fees, proplists:get_value(fees, Details)}]]})
        end;   
      false->
        case proplists:get_value(lesser_than, Acc) of
          undefined -> [{lesser_than, [[{name, proplists:get_value(name, X)},{fees, proplists:get_value(fees, Details)}]]} | Acc];
          Value     -> lists:keyreplace(lesser_than, 1, Acc, {lesser_than, Value ++ [[{name, proplists:get_value(name, X)},{fees, proplists:get_value(fees, Details)}]]})
      end
    end
  end,
  lists:foldl(Fun, [], List).


to_value($M) -> 1000;
to_value($D) ->  500;
to_value($C) ->  100;
to_value($L) ->   50;
to_value($X) ->   10;
to_value($V) ->    5;
to_value($I) ->    1.

roman([])-> 0;
roman([H1])-> to_value(H1);
roman([H1,H2 | Rest])->
    case {to_value(H1), to_value(H2)} of
        {A1,A2} when A1 < A2 -> A2 - A1 + roman(Rest);
        {A1,A2} -> A1 + A1 + roman(Rest);
        {A1, _} -> A1 + roman([H2|Rest])
    end.

  