defmodule Orangeade.Generator.Integer do
  @moduledoc """
  Provides a function for creating a stream of integers.
  """

  alias Orangeade.Generator.BoundNatural

  @doc """
  Given a limit creates a stream of integers between limit and negative limit.
  
  ## Examples

      iex(1)> s = Orangeade.Generator.Integer.stream(limit: 1000)
      [-1 | #Function<0.132496296/0 in Orangeade.Generator.Integer.do_stream/1>]

      iex(2)> Caffeine.Stream.take(s, 10)
      [-1, 412, -419, 710, -269, 520, -983, 618, -929, 44]

  """
  @spec stream([limit: non_neg_integer]) :: Caffeine.Stream.t()
  def stream(limit: i) do
    do_stream(sign: BoundNatural.stream(limit: 2),
      fill: BoundNatural.stream(limit: i))
  end

  defp do_stream(sign: sign_index_stream,
    fill: number_stream) do
    rest = fn ->
      do_stream(sign: Caffeine.Stream.tail(sign_index_stream),
        fill: Caffeine.Stream.tail(number_stream))
    end
    sign_index = Caffeine.Stream.head(sign_index_stream)
    number = Caffeine.Stream.head(number_stream)
    Caffeine.Stream.construct(create_sign(sign_index) * number, rest)
  end

  defp create_sign(n) do
    case n do
      0 -> 1
      1 -> -1
    end
  end
end
