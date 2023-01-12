-module(basic).
-export([
test/1,
add_row/1

]).

% test(List)->
%     lists:usort(List).


test([])-> 0;
test(List)-> test(List,1).

test([], Test)-> Test;
test([Head|Tail], Test)-> test(Tail, Test * Head).


% =====================================================================

add_row(Initial) -> add_row(Initial, 1, []).

add_row([], 0, Final) -> [0 | Final];

add_row([H | T], Last, New) -> add_row(T, H, [Last + H | New]).

% =====================================================================

