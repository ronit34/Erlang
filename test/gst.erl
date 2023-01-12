-module(gst).
-export([test/2]).


test(Item,X)->
    case Item of
        
        r -> (X*25)/100 + X;
        b -> (X*10)/100 + X;
        f -> (X*5)/100 + X;
        _-> (X*15)/100 + X

    end.


