defmodule Orangeade.Generator.PrintableASCIICharacter do
  @moduledoc """
  Provides a function for creating a stream of ASCII characters.
  """

  alias Orangeade.Generator.BoundNatural

  @doc """
  Creates a stream of ASCII characters.

  ## Examples

      iex(1)> s = Orangeade.Generator.PrintableASCIICharacter.stream()
      [33 | #Function<1.23635164/0 in Caffeine.Stream.map/2>]

      iex(2)> Caffeine.Stream.take(s, 10)
      '!he@E@?l{$'

  """
  @spec stream() :: Caffeine.Stream.t()
  def stream do
    Caffeine.Stream.map(BoundNatural.stream(limit: length()), &to_number_between_bounds/1)
  end

  defp to_number_between_bounds(n) do
    lower_bound() + n
  end

  defp length do
    upper_bound() - lower_bound()
  end

  defp lower_bound do
    ?\s
  end

  defp upper_bound do
    ?~
  end
end
