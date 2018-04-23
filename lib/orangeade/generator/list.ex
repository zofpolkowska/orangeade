defmodule Orangeade.Generator.List do
  @moduledoc"""
  Provides a function to generate uniform lists
  """

  @doc"""
  Generates a stream of uniform lists 

  # Example

  iex> args = Orangeade.Generator.Printable.ASCII.stream()          
       [33 | #Function<1.23635164/0 in Caffeine.Stream.map/2>]
  iex> lists = Orangeade.Generator.List.stream(args: args, limit: 10)
       ['!' | #Function<0.90383687/0 in Orangeade.Generator.List.stream/2>]
  iex> Caffeine.Stream.take(lists, 6)                                
       ['!', 'he', '@E@?l{$w@', [], '7$O:!2[:-', []]

  """
  def stream(args: a, limit: l) do
    stream(a, Orangeade.Generator.BoundNatural.stream(limit: l))
  end

  defp stream(args, lens) do
    {a, b} = split(args, Caffeine.Stream.head(lens))
    rest = fn ->
	stream(b, Caffeine.Stream.tail(lens)) end
    Caffeine.Stream.construct(a, rest)
  end

  defp split(args, len) do
    {Caffeine.Stream.take(args, len),
     rest(args, len)}
  end
  
  defp rest(args, 0), do: args
  defp rest(args, len) do
    rest(Caffeine.Stream.tail(args), len - 1)
  end
end
