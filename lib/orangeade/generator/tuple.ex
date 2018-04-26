defmodule Orangeade.Generator.Tuple do
  @moduledoc """
  Provides a function for creating a stream of tuples.
  """

  @doc """
  Given a list with type streams creates a stream of tuples containing
  consecutive elements of these streams. Length of tuple is the same as number
  of given streams.

  ## Examples

      iex(1)> s = Orangeade.Generator.Tuple.stream([Orangeade.Generator.Term.stream,
      Orangeade.Generator.Integer.stream])
      [{'!', -1} | #Function<0.52196285/0 in Orangeade.Generator.Tuple.stream/1>]

      iex(2)> Caffeine.Stream.take(s, 10) 
      [{'!', -1}, {<<1>>, 56412}, {"!", -11419}, {-0.99999, 29710}, {-1, -95269}]

  """
  @spec stream(list(Caffeine.Stream.t())) :: Caffeine.Stream.t()
  def stream(stream_list) do
    {tuple_elements, next_tuple_elements} = drain_streams(stream_list)

    rest = fn ->
      stream(next_tuple_elements)
    end

    Caffeine.Stream.construct(List.to_tuple(tuple_elements), rest)
  end

  defp drain_streams(stream_list) do
    {Enum.map(stream_list, &Caffeine.Stream.head/1),
     Enum.map(stream_list, &Caffeine.Stream.tail/1)}
  end
end
