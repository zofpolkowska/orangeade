defmodule Orangeade.Generator.Map do
  @moduledoc"""
  Provides a function to generate maps
  """

  @doc"""
  Generates maps from values given as arguments and of limited lengths
  # Example
  iex> s = Orangeade.Generator.Map.stream(keys:             
  ...> Orangeade.Generator.Logical.stream(),   
  ...> values:                                 
  ...> Orangeade.Generator.PrintableASCIICharacter.stream(),
  ...> limit: 10)                                           
      [%{false: '!'} | #Function<0.76699128/0 in Orangeade.Generator.Map.stream/3>]
  iex> Caffeine.Stream.take(s, 3)
      [
        %{false: '!'},
        %{false => 'h', nil => 'e'},
        %{nil => '@', true => 'l', false => 'i', nil => 'E', nil => 'W', false => '}'}
      ]
  """
  def stream(keys: k, values: v, limit: l) do
    stream(k, v, Orangeade.Generator.BoundNatural.stream(limit: l))
  end

  defp stream(keys, values, lens) do
    l = Caffeine.Stream.head(lens)
    {_k, ktail} = split(keys, l)
    {_v, vtail} = split(values, l)
    tuples = Caffeine.Stream.take(
      Orangeade.Generator.Tuple.stream(args: [keys, values]),
      l)
    h = Enum.into(tuples, %{})
    
    rest = fn ->
      stream(ktail, vtail, Caffeine.Stream.tail(lens)) end

    Caffeine.Stream.construct(h, rest)
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
