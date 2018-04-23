defmodule Orangeade.Generator.Tuple do
  @moduledoc"""
  Provides a function to generate a stream of tuples with defined values
  """

  @doc"""
  Generates a stream of tuples from the given arguments
  # Example
  iex> a = Orangeade.Generator.Logical.stream()                
      [false | #Function<1.23635164/0 in Caffeine.Stream.map/2>]
  iex> b = Orangeade.Generator.PrintableASCIICharacter.stream()
      [33 | #Function<1.23635164/0 in Caffeine.Stream.map/2>]
  iex> c = Orangeade.Generator.BoundNatural.stream(limit: 13)  
      [1 | #Function<1.23635164/0 in Caffeine.Stream.map/2>]
  iex> s = Orangeade.Generator.Tuple.stream(args: [a,b,c])     
      [
        {false, '!', 1} |
        #Function<0.103631357/0 in Orangeade.Generator.Tuple.stream/1>
      ]
  iex> Caffeine.Stream.take(s, 5)                         
      [{false, '!', 1}, {3, 'h', false}, {nil, 'e', 0}, {5, '@', nil}, {nil, 'E', 3}]
  """
  def stream(args: l) do
    {h, t} = parts(l, {}, [])
    rest = fn ->
      stream(args: t) end
    
    Caffeine.Stream.construct(h, rest)
  end

  defp parts([], heads, tails), do: {heads, tails}
  defp parts([h|t], heads, tails) do
    parts(t, Tuple.append(heads, fst(h)), [Caffeine.Stream.tail(h)|tails])
  end

  defp fst(s) do
    e = Caffeine.Stream.take(s, 1)
    cond do
      List.ascii_printable?(e) ->
	e
      true ->
	hd(e)
    end
  end
end
