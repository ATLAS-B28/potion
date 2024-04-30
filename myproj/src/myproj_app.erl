%%%-------------------------------------------------------------------
%% @doc myproj public API
%% @end
%%%-------------------------------------------------------------------

-module(myproj_app).

%-behaviour(application).

-export([factorial/1,find_even/2,palindrome/1, match_pattern/1, area/1, even_numbers/0, squared_numbers/0, map/2, compose/1, start/0, start_con/0
    , create/1, reverse/1, sum/1,new/0, push/2, pop/1, isempty/1]).
%%-export([start/2, stop/1]).

%%start(_StartType, _StartArgs) ->
   %% myproj_sup:start_link().

%%stop(_State) ->
  %%  ok.

%% internal functions
%%%------------------------------------------------------
factorial(0) ->
    1;
factorial(N) when N > 0 -> 
    N * factorial(N -1).

%%Find even numbers in a given range
%%take the numbers between which we find even numbers 
%%call the func again with empty List as well as start and end
%%if start is > end then use list:reverse and fill in
%%the list correctly
%%afterwards do start % 2 with rem and if == 0
%%then move the start by 1 and in the list start from N to end of it
%%and then do the recursive call with start + 1 

find_even(Start, End) ->
    find_even(Start, End, []).

find_even(N, End, EvenNumbers) when N > End ->
    lists:reverse(EvenNumbers);
find_even(N, End, EvenNumbers) when N rem 2 == 0 ->
    find_even(N + 1, End, [N | EvenNumbers]);
find_even(N, End, EvenNumbers) ->
    find_even(N + 1, End, EvenNumbers).

%%palindrome
%%get the string 
%%create clean string where we apply a filter/2
%%here the 1st is an anonymous function
%%where we get the character and if it is not equal to $\s
%%with ascii 32-bit then return the character and create new list
%%and reverse the string in the 2nd argument
%%finally compare the new string with reverse of c and if they 
%%are same then return true 

palindrome(String) ->
    CleanString = lists:filter(fun(C) -> C /= $\s end, string:to_lower(String)),
    CleanString == lists:reverse(CleanString).

%pattern match
%get the value
%use the case of result
%and there is another case
%
%
%
%%

match_pattern(Value) ->
    case Value of
        {ok, Result} ->
            io:format("Result: ~p~n", [Result]);
        {error, Reason} ->
            io:format("Error: ~p~n", [Reason]);
        _ ->
            io:format("Unknown Value~n")
        end.

area({square,Side}) -> Side * Side;
area({rectangle, Width, Height}) ->Width * Height;
area({circle, Radius}) -> 3.14159 * Radius * Radius.

even_numbers() -> [N || N <- [1,2,3,4,5,6], N rem 2 == 0].
%% || list comprehension separates the input list from the resulting one

squared_numbers() -> [N*N || N <- [1,2,3,4,5,6,7,8], N rem 2 == 0].

%%higher order function

map(Function, List) ->
    [Function(X) || X <- List].

%%complex higher order function
%%Acc - accumulator
%%foldl -> is used to apply the input functions
%%to X in order. It takes 3 arguments
%%1) A function that defines the operation to be 
%%performed on each element of the 
%%list. In this case, it is
%%fun(F, Acc) -> F(Acc) end, which 
%%applies the function F to the 
%%accumulator Acc.
%%2) The initial value of the 
%%accumulator, which is X in this case.
%%3) The list of functions to be applied.

compose(Functions) ->
    fun(X) ->
        lists:foldl(fun(F,Acc) -> F(Acc) end, X, Functions)
    end.

%%parallelism

start() ->
    spawn(fun() -> worker(1) end),
    spawn(fun() -> worker(2) end),
    spawn(fun() -> worker(3) end).

worker(ID) ->
    io:format("Worker ~p started~n", [ID]),
    do_work(ID),
    io:format("Worker ~p finished~n", [ID]).

do_work(ID) ->
    %performing some conputation
    %%this could be a loop or intense task
    lists:foreach(fun(X) -> do_work_item(ID, X)end, lists:seq(1,10)).

do_work_item(ID, X) ->
    %single item is worked upon
    io:format("Worker ~p is working on item ~p~n",[ID,X]).


%concurrency

start_con() ->
    Pid1 = spawn(fun() -> worker_con(1) end),
    Pid2 = spawn(fun() -> worker_con(2) end),
    Pid3 = spawn(fun() -> worker_con(3) end),
    Pid1 ! {self(), hello},
    Pid2 ! {self(), world},
    Pid3 ! {self(), concurrency},
    receive
        {Pid, Message} ->
            io:format("Received message ~p from ~p~n", [Message, Pid])
    end.

worker_con(ID) ->
    io:format("Worker ~p started~n", [ID]),
    receive
        {From, Message} ->
            io:format("Worker ~p received message ~p from ~p~n", [ID, Message, From]),
            From ! {self(), ack}
    end,
    io:format("Worker ~p finished~n",[ID]).

%%%%--------------------------------------------------------
%linked list

create([]) ->
    [];
create([H|T]) ->
    {H, create(T)}.


reverse([]) ->
    [];
reverse({H,T}) ->
    {reverse(T), H}.

sum([]) ->
    0;
sum({H, T}) ->
    H + sum(T).

%% stack

new() ->
    [].

push(Stack, Element) ->
    [Element | Stack].

pop([]) ->
    {empty , []};
pop([Head | Tail]) ->
    {ok, Head, Tail}.

isempty([]) ->
    true;
isempty(_) ->
    false.