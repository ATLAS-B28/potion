-module(demo2).
%%This line defines the module 
%%name as basic. Modules are used to 
%%organize code in Erlang.
-import(string,[len/1, concat/2, chr/2, substr/3, str/2, to_lower/1, to_upper/1]).
-export([main/0]).
%% This line specifies that 
%% the hello function is 
%% accessible from outside the 
%% module. The /0 indicates that 
%% the function takes 0 arguments.
%hello() -> io:format("Hello World, this is Aditya Bhambere!~n").

%add(A,B) ->
   %  hello(),
  %   A + B. 

%add(A,B,C) -> 
 %   hello(),
%    A + B + C.

main() -> 
    var_stuff().

var_stuff() ->
    X = 5,
    Y = X + 3,
    io:format("The Value of Y = ~w~n", [Y]).