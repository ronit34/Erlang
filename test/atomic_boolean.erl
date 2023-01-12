-module(atomic_boolean).
-export([num/1,gate/1]).

num(greater) ->
	3 < 2;
num(lesser) ->
	3 > 2;
num(equal) ->
	10 == 10;
num(notequal) ->
	10 =/= 9.
gate(ands) ->
	true and true;
gate(tandf) ->
	true and false;
gate(torf) ->
	true or false;
gate(forf) ->
	false or false;
gate(txorf) ->
	true xor false;
gate(txort) ->
	true xor true;
gate(nnot) ->
	not true.
