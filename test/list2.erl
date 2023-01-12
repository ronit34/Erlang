-module(list2).
-export([getmarksf/0
% getmarksmathsf/0,
% feesunpaidf/0
]).


getmarksf()->
    List = [
    [{name, "anil"},{marks, 40},{subject, maths},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "anil"}, {marks, 60},{subject, maths},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "akash"},{marks, 80},{subject, english},{details, [{scholarship, yes},{fees, paid}]}],
    [{name, "ram"},{marks, 34},{subject, geography},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "manoj"},{marks, 99},{subject, maths},{details, [{scholarship, yes},{fees, unpaid}]}]
  ],
  T= fun(X,Acc)->
    case proplists:get_value(marks,X)<50 of
      true->[proplists:get_value(name,X)]++Acc;
      _->Acc end
    end,
    lists:foldl(T,[],List).


getmarksmathsf()->
    List = [
    [{name, "anil"},{marks, 40},{subject, maths},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "anil"}, {marks, 60},{subject, maths},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "akash"},{marks, 80},{subject, english},{details, [{scholarship, yes},{fees, paid}]}],
    [{name, "ram"},{marks, 34},{subject, geography},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "manoj"},{marks, 99},{subject, maths},{details, [{scholarship, yes},{fees, unpaid}]}]
  ],
  T=fun(X,Acc)->
    case proplists:get_value(subject,X)==maths of
      true-> proplists:get_value(marks,X)+Acc;
      false->Acc end
    end,
    lists:foldl(T,0,List).

feesunpaidf()->
  List = [
    [{name, "anil"},{marks, 40},{subject, maths},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "anil"}, {marks, 60},{subject, maths},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "akash"},{marks, 80},{subject, english},{details, [{scholarship, yes},{fees, paid}]}],
    [{name, "ram"},{marks, 34},{subject, geography},{details, [{scholarship, no},{fees, unpaid}]}],
    [{name, "manoj"},{marks, 99},{subject, maths},{details, [{scholarship, yes},{fees, unpaid}]}]
],
T = fun(X,Acc)-> 
  A=proplists:get_value(details,X),
  B=(proplists:get_value(scholarship,A)==no) and (proplists:get_value(fees,A)==unpaid),
  case B of
    true->proplists:get_value(marks,X)+Acc;
    false->Acc end
  end,
  lists:foldl(T,0,List).