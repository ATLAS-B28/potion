defmodule KV.Maths do
  #def sum(a,b) do
   # do_sum(a,b)
  #end

  #defp do_sum(a,b) do
   # a + b
  #end

  #def zero?(0), do: true

  def zero?(x) when is_integer(x) and x > 0, do: true
end

IO.puts KV.Maths.zero?(1)
