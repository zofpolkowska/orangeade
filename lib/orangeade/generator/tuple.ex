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
      [{false, '!', 1}, {false, 'h', 3}, {nil, 'e', 0}, {nil, '@', 5}, {nil, 'E', 3}]
  """
  def stream(args: l) do
    {h, t} = parts(l, [], [])
    rest = fn ->
      stream(args: t) end
    
    Caffeine.Stream.construct(List.to_tuple(h), rest)
  end

  defp parts([], heads, tails), do: {heads, Enum.reverse(tails)}
  defp parts([h|t], heads, tails) do
    parts(t, [fst(h)| heads], [Caffeine.Stream.tail(h)|tails])
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
