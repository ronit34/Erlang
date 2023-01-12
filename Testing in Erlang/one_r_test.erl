-module(one_r_test).

-include_lib("eunit/include/eunit.hrl").

simple_test()->
    [?assertEqual(10, one:zx(5)),
    ?_assert(one:zx(10) =:= 15),
    ?assertEqual(10, one:zx(95)),
    ?_assertException(error,function_clause, one:zx(13))].
    
outside_test()->
    ?assertEqual(14, one:total()).


% simple2_test()->
%     ?_assertException(error, function_clause, one:zx(13)).


% eunit:test(one_r_test).