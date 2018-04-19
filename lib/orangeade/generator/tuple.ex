defmodule Orangeade.Generator.Tuple do
  @moduledoc """
  Provides a function to generate tuples
  """

  @doc """
  Generates a stream of tuples of values from streams which are passed as parameters

  ## Example

  iex> Caffeine.Stream.take(
  ...> Orangeade.Generator.Tuple.stream(                  
  ...> Orangeade.Generator.BoundNatural.stream(limit: 10),
  ...> Orangeade.Generator.Printable.ASCII.stream()),
  ...> 10)
  [
    {1, '!'},
    {2, 'h'},
    {9, 'e'},
    {0, '@'},
    {9, 'E'},
    {0, '@'},
    {3, '?'},
    {8, 'l'},
    {9, '{'},
    {4, '$'}
  ]

  """
  #@spec stream(S.t,S.t) :: S.t
  def stream(k, v) do
    e = heads(k, v)
    rest = fn ->
      stream(Caffeine.Stream.tail(k), Caffeine.Stream.tail(v)) end
    Caffeine.Stream.construct(e, rest)
  end

  defp heads(k, v) do
    {Caffeine.Stream.head(k), Caffeine.Stream.take(v,1)}
  end
end
