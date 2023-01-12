-module(rna).
-export([dna/1]).

dna(List) ->
    Fun = fun(X) ->
        case X of 
            "G" -> "C";
            "C" -> "G";
            "T" -> "A";
            "A" -> "U"
        end
    end,
    lists:map(Fun,List).