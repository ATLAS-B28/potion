
-module(myproj_app).
-export([fac/1, mult/2, convert/2, convert_length/1]).

fac(1) ->
    1;
fac(N) ->
    N * fac(N-1).

mult(X,Y) ->
    X * Y.

convert(N, centimeter) ->
    N * 2.54.

convert_length({centimeter, X}) ->
    {inch, X / 2.54};
convert_length({inch, Y}) ->
    {centimeter, Y * 2.54}.