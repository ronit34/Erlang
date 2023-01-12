-module(boolean).
-export([b_not/1,b_and/2,b_or/2,b_nand/2]).


b_not(A)-> 
    case A of
	true -> false;
    false -> true end.
b_and(A,B)->
    case {A,B} of
        {true, true} -> true;
        _ -> false end.

b_or(A,B)->
    case {A,B} of
        {false,false} -> false;
         _->true end.

b_nand(A,B)->
    case {A,B} of
        {false,false} -> false;
        {true,true} -> false;
        _-> true end.
