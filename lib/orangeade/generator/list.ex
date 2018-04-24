defmodule Orangeade.Generator.List do
  @moduledoc """
  Provides a function for creating a stream of lists.
  """

  alias Orangeade.Generator.BoundNatural

  @doc """
  Given length and type stream creates a stream of lists filled with given type.
  When length is not passed, it is set to 10.

  ## Examples

      iex(1)> s = Orangeade.Generator.List.stream
      [[-1] | #Function<0.40676257/0 in Orangeade.Generator.List.do_stream/1>]

      iex(2)> Caffeine.Stream.take(s, 10) 
      [
      [-1],
      [56412, -11419],
      [29710, -95269, 93520, -13983],
      [],
      [47618, -21929, 83044, -92931]
      ]

  """
  @spec stream(length: non_neg_integer, fill: Caffeine.Stream.t()) :: Caffeine.Stream.t()
  def stream(args) do
    {length, type_stream} = get_config(args)

    do_stream(
      length: BoundNatural.stream(limit: length),
      fill: type_stream
    )
  end

  defp get_config(fill: stream) do
    {10, stream}
  end

  defp get_config(length: l, fill: stream) do
    {l, stream}
  end

  defp do_stream(length: length_stream, fill: type_stream) do
    {head, reduced_type_stream} = drain_elements(Caffeine.Stream.head(length_stream), type_stream)

    rest = fn ->
      do_stream(
        length: Caffeine.Stream.tail(length_stream),
        fill: reduced_type_stream
      )
    end

    Caffeine.Stream.construct(head, rest)
  end

  defp drain_elements(n, stream) do
    {Caffeine.Stream.take(stream, n), reduce_stream(n, stream)}
  end

  defp reduce_stream(0, reduced_stream) do
    reduced_stream
  end

  defp reduce_stream(i, stream) do
    reduce_stream(i - 1, Caffeine.Stream.tail(stream))
  end
end
