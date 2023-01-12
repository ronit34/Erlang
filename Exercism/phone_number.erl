-module(phone_number).
-export([phone/1]).

phone(Num)->
    re:replace(Num, "-", "",[global,{return,list}]).
    