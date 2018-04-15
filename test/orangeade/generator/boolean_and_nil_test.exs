defmodule Orangeade.Generator.BooleanAndNilTest do
  use ExUnit.Case
  alias Orangeade.Generator.BooleanAndNil

  test "Check if the first 10 generated elements are booleans or nils" do
    list_of_elements = BooleanAndNil.stream()
    |> Caffeine.Stream.take(10)
    assert Enum.all?(list_of_elements, &boolean_or_nil/1)
  end

  defp boolean_or_nil(n) when is_boolean(n), do: true
  defp boolean_or_nil(n) when n == nil, do: true
  defp boolean_or_nil(_n), do: false
end
