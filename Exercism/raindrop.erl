-module(raindrop).

-export([convert/1, test_version/0]).


    convert(Number) when Number rem 105 =:= 0 ->
        "PlingPlangPlong";
    convert(Number) when Number rem 35 =:= 0 ->
        "PlangPlong";
    convert(Number) when Number rem 21 =:= 0 ->
        "PlingPlong";
    convert(Number) when Number rem 15 =:= 0 ->
        "PlingPlang";
    convert(Number) when Number rem 3 =:= 0 ->
        "Pling";
    convert(Number) when Number rem 5 =:= 0 ->
        "Plang";
    convert(Number) when Number rem 7 =:= 0 ->
        "Plong";
    convert(Number) ->
        integer_to_list(Number).
    
    test_version() -> 1.
