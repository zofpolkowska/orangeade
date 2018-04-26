defmodule Orangeade.Generator.BooleanAndNil do
  @moduledoc """
  Provides a function for creating a stream of booleans and nils.
  """

  alias Orangeade.Generator.BoundNatural

  @doc """
  Creates a stream of booleans and nils.

  ## Examples

      iex(1)> s = Orangeade.Generator.BooleanAndNil.stream()
      [false | #Function<1.23635164/0 in Caffeine.Stream.map/2>]

      iex(2)> Caffeine.Stream.take(s, 10)
      [false, false, true, true, true, true, false, nil, false, true]

  """
  @spec stream() :: Caffeine.Stream.t()
  def stream do
    Caffeine.Stream.map(BoundNatural.stream(limit: 3), &to_boolean_or_nil/1)
  end

  defp to_boolean_or_nil(n) do
    case n do
      0 -> nil
      1 -> false
      2 -> true
    end
  end
end
