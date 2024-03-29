defmodule KV.EnumStream do
  #Enum.each() - Applies the given function to each element of the list.
  #example
  #def print_squares(list) do
   # Enum.each(list, fn(number)->
    #  IO.puts("Square of #{number} is: #{number * number}" )
    #end)
  #end

  #def double_and_uppercase(list) do
    #Enum.map() - Creates a new list by applying the given function to each element.
    #example
    #Enum.map(list, fn(item) ->
     # String.upcase(item |> to_string |> String.trim) |> String.duplicate(2)
      # |> - pipe operator, used for chaining function calls in a more readable and concise way.
      #takes the result from left-hand side and passes it as first argument to
      #function on right-hand side
    #end)
  #end

  #Enum.filter() - Creates a new list containing only elements that meet the given condition.
  #def filter_even_numbers(list) do
   # Enum.filter(list, fn(number) -> rem(number, 2) == 0 end)
  #end

  #Enum.reduce(list, 0, function used to reduce the list elements into a single value)
  #def sum_list(list) do
   # Enum.reduce(list, 0, fn(item, acc) -> acc + item end)
  #end

  #def find_max(list) do
   # Enum.reduce(list, Float.min_finite(), fn(acc, item) -> max(acc, item) end)
  #end

  #Enum.find(list, fun): Finds the first element that meets the given condition.
  #def find_first_even(list) do
  #  Enum.find(list, fn(item) -> rem(item, 2) == 0 end)
  #end

  #def find_first_a(list) do
  #  Enum.find(list, fn(char) -> String.starts_with?(char,"a") end)
  #end

  #This means that when performing multiple operations with Enum,
  #each operation is going to generate an intermediate list until
  #we reach the result

  #eager evalution
  #def eager_check(_list) do
   # odd? = fn x -> rem(x ,2) != 0 end
   # 1..100_00 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum()
  #end

  #streams - Streams are lazy, composable enumerables.
  #and lazy ecaluation
  #Instead of generating intermediate lists, streams build a series of
  #computations that are invoked only when we pass
  #the underlying stream to the Enum module. Streams are
  #useful when working with large, possibly infinite, collections.
  #def lazy_eval() do
   #odd? = fn (item) -> rem(item, 2) != 0  end
   #1..100_00 |> Stream.map(&(&1 * 5)) |> Stream.filter(odd?)
  #end
  #Many functions in the Stream module accept any enumerable
  #as an argument and return a stream as a result.
  #It also provides functions for creating streams.
  #like Stream.cycle/1
  def cycling() do
    #stream = Stream.cycle([1,2,3,4,5]) <- don't use Enum.take()
    stream1 = Stream.unfold("Aditya", &String.next_codepoint/1)
    #Enum.take(stream, 10)
    Enum.take(stream1, 6)
  end

end


#my_list = [1,2,3,4]
#my_list = [" hello "," world "]
#double_and_uppercase = KV.EnumStream.double_and_uppercase(my_list)
#IO.inspect(double_and_uppercase)

#filter_even_numbers = KV.EnumStream.filter_even_numbers(my_list)
#sum_list = KV.EnumStream.sum_list(my_list)
#find_max = KV.EnumStream.find_max(my_list)
#IO.inspect(sum_list)
#IO.inspect(find_max)

#found = KV.EnumStream.find_first_even(my_list)
#found2 = KV.EnumStream.find_first_a(["b","a","c"])
#IO.inspect(found)
#IO.inspect(found2)
#found3 = KV.EnumStream.lazy_eval()
#IO.inspect(found3)

cycling_func = KV.EnumStream.cycling()
IO.inspect(cycling_func)
