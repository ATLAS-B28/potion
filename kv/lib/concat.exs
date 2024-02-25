defmodule KV.Concat do
  def join(a,b,sep \\ " ") do
    a <> sep <> b
    #The <>/2 operator can also be used in pattern matching (and guard clauses) as long as the left argument is a literal binary:
    #iex> "foo" <> x = "foobar"
    #iex> x
    #"bar"
  end

  def dowork(x \\ "default") do
    x
  end
  #When using default values, one must be
  #careful to avoid overlapping function definitions

  def jointwo(a, b \\ nil, sep \\ " ")

  def jointwo(a, b, _sep) when is_nil(b) do
    a
  end

  def jointwo(a,b,_sep) do
    a <> b
  end

  def jointwo(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts KV.Concat.join("a", "b")
IO.puts KV.Concat.join("a", "b", "-")
IO.puts KV.Concat.dowork()
IO.puts KV.Concat.dowork("foo")
IO.puts KV.Concat.jointwo("a","b")
IO.puts KV.Concat.jointwo("a","b","_")
IO.puts KV.Concat.jointwo("a")
