defmodule Orangeade.Generator.Float do
  @moduledoc """
  Provides a function for creating a stream of floats.
  """

  alias Orangeade.Generator.BoundNatural
  alias Orangeade.Generator.Integer

  @doc """
  Given a limit and a fraction digits limit creates a stream of floats
  between the limit and the negative limit.

  ## Examples

      iex(1)> s = Orangeade.Generator.Float.stream(limit: 1000, fraction_digits_limit: 5)
      [-0.99999 | #Function<1.103330561/0 in Orangeade.Generator.Float.do_stream/1>]

      iex(2)> Caffeine.Stream.take(s, 10)
      [-0.99999, 412.56412, -418.88581, 710.2971, -268.04731, 520.9352, -982.86017,
      618.47618, -928.78071, 44.83044]

  """
  @spec stream(limit: non_neg_integer, fraction_digits_limit: non_neg_integer) ::
          Caffeine.Stream.t()
  def stream(limit: l, fraction_digits_limit: fl) do
    do_stream(
      integer_digits: Integer.stream(limit: l),
      fraction_digits: create_fractions(fraction_digits_limit: fl)
    )
  end

  defp do_stream(
         integer_digits: integer_stream,
         fraction_digits: fraction_stream
       ) do
    rest = fn ->
      do_stream(
        integer_digits: Caffeine.Stream.tail(integer_stream),
        fraction_digits: Caffeine.Stream.tail(fraction_stream)
      )
    end

    float =
      build_float(Caffeine.Stream.head(integer_stream), Caffeine.Stream.head(fraction_stream))

    Caffeine.Stream.construct(float, rest)
  end

  defp create_fractions(fraction_digits_limit: l) do
    f = fn x -> x / power_of_ten(index: l) end
    Caffeine.Stream.map(BoundNatural.stream(limit: power_of_ten(index: l)), f)
  end

  defp power_of_ten(index: i) do
    :math.pow(10, i)
    |> round
  end

  defp build_float(integer, fraction) do
    integer + fraction
  end
end
