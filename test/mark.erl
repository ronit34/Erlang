-module(mark).
-export([
less_than/0,
total_score/0,
fees/0,
replace_key/0,
key_change/0,
less/0,
total/0,
fee/0
]).

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
% 1) tell me the names all of students who scored less than 50 marks in exam.
    

less_than()->
    Data = test(),
    Fun = fun(X)->
        case proplists:get_value(marks, X) < 50 of
            true->{true, proplists:get_value(name, X)};
            false->false
        end
    end,
    lists:filtermap(Fun, Data).


% 2) tell me the total score of students who has subject maths.

total_score()->
    Data = test(),
    Fun = fun(X)-> 
        case proplists:get_value(subject, X) == maths of
            true-> {true,proplists:get_value(marks, X)};
            false-> false
        end
    end,
    % lists:filtermap(Fun, Data)++[1].
    lists:sum(lists:filtermap(Fun, Data)).


% 3) tell me the student's total score who havent's paid there fees also not having scholarship.

% fees()->
%     Data = test(),
%     Fun = fun(X)->
%         List = case proplists:get_value(details,X) of true->{true,proplists:get_value(details,X)}; false->false; undefined->false end,

%         A = proplists:get_value(scholarship, List) == no,
%         B = proplists:get_value(fees, List) == unpaid,
%         List_dt = {A,B},
%         case List_dt of
%             true->{true,proplists:get_value(marks, X)};
%             false->false
%         end
%     end,
%     lists:filtermap(Fun, Data).

fees()->
    Data = test(),
    Fun = fun(X, Acc)->
        case proplists:get_value(details, X) of 
            undefined->Acc;
            _->case {proplists:get_value(scholarship, proplists:get_value(details, X)), proplists:get_value(fees, proplists:get_value(details, X))} of
                {no, unpaid}->Acc + proplists:get_value(marks, X);
                _->Acc
                    end
        end
    end,
    lists:foldl(Fun, 0, Data).


% =============================================================================================================================================================
% =============================================================================================================================================================
replace_key()->
    Data = [
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
],
    Fun = fun(X)->
        case proplists:get_value(details, X) of
            undefined->false;
            Details  -> case {proplists:get_value(scholarship, Details), proplists:get_value(fees, Details)} of
                        [no, unpaid]-> [(lists:keyreplace(scholarship, 1, X,yes)),(lists:keyreplace(fees, 1, X,paid))];
                        _->false 
                    end
        end
    end,
    lists:map(Fun, Data).


key_change()->
    Data = test(),
    Fun = fun(X)->
        Details = proplists:get_value(details, X),
        New = lists:keyreplace(scholarship, 1, Details, {scholarship, yes}),
        FNew = lists:keyreplace(fees, 1, New, {fees, paid}),
        lists:keyreplace(details, 1, X, {details,FNew})
    end,
    lists:map(Fun, Data).


% 1) tell me the names all of students who scored less than 50 marks in exam.
% less()-> 
%     Data = test(),
%     less(List, []).
less()->
    List = test(),
    less(List,[]).

less([],Acc)->
    Acc;

less([Student | TailStudentList], Acc)->
    case proplists:get_value(marks, Student) < 50 of
        true ->
        less(TailStudentList, Acc ++ [proplists:get_value(name, Student)]);
        false->
        less(TailStudentList, Acc)
    end.


% 2) tell me the total score of students who has subject maths.
total()-> 
    List = test(),
    total(List,0).

total([],Acc)->
    % lists:sum(Acc);
    Acc;

total([Student | TailStudentList], Acc)->
    case proplists:get_value(subject, Student) == maths of
        true-> total(TailStudentList, Acc + proplists:get_value(marks, Student));
        false->total(TailStudentList, Acc)
    end.

% 3) tell me the student's total score who havent's paid there fees also not having scholarship.
fee()->
    List = test(),
    fee(List,0).

fee([],Acc)->
    Acc;

fee([Student | TailStudentList], Acc)->
    A = proplists:get_value(details, Student),
    B = (proplists:get_value(scholarship,A) == no) and (proplists:get_value(fees,A) == unpaid),
    case B of
        true->fee(TailStudentList,Acc + proplists:get_value(marks, Student));
        _->fee(TailStudentList,Acc)
end.