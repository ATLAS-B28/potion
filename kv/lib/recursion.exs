defmodule KV.Recursion do
  #def multi_times(msg, n) when n > 0 do
   # IO.puts(msg)
    #multi_times(msg, n-1)
  #end

  #def multi_times(_msg, 0) do
   # :ok
  #end

 #list - divide it into head and tail
 #head will be then added to an existing
 #sum variable and tail is passed into the sum_list
 #function for recursion
 #def sum_list([head | tail], acc) do
  # sum_list(tail, head + acc)
 #end

 #def sum_list([], acc) do
  # acc
 #end

 #The process of taking a list and reducing
 #it down to one value is known as a reduce
 #algorithm and is central
 #to functional programming.

 def double_each([head | tail]) do
   [head * 2 | double_each(tail)]
 end

 #iex(3)> Enum.reduce([1,2,3],0, fn x, acc -> x + acc end)
 #6
 #iex(4)> Enum.reduce([1,2,3,4], 0, fn x , acc -> x + acc end)
 #10
 #iex(5)> Enum.map([1,2,3,4], fn x -> x * 2 end)
 #[2, 4, 6, 8]
 #iex(6)> Enum.map([1,2,3,4], fn x -> x * 2 end)
 #[2, 4, 6, 8]
 #iex(7)> Enum.reduce([1,2,3,4], &+/2)
 #iex(8)> Enum.map([1,2,3,4], &(&1 * 2))
 #[2, 4, 6, 8]
 #iex(9)> Enum.map([1,2,3,4], &(&1 * 2))

end

IO.puts KV.Recursion.double_each([1,2,3])
#KV.Recursion.multi_times("Hello",-1)#5)
:ok
