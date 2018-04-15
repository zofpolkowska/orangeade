defmodule Orangeade.Generator.TermTest do
  use ExUnit.Case
  alias Orangeade.Generator.Term

  test "Check if there are different data types in first 50 generated elements" do
    list_of_elements = Term.stream()
    |> Caffeine.Stream.take(100)
    list_of_conditions = [
      Enum.any?(list_of_elements, &is_negative/1),
      Enum.any?(list_of_elements, &is_in_range_32_126/1),
      Enum.any?(list_of_elements, &is_atom/1),
      Enum.any?(list_of_elements, &is_binary/1),
      Enum.any?(list_of_elements, &is_integer/1),
      Enum.any?(list_of_elements, &is_float/1),
      Enum.any?(list_of_elements, &boolean_or_nil/1)
    ]
    assert Enum.all?(list_of_conditions)
  end

  defp is_negative(n) when n < 0, do: true
  defp is_negative(_n), do: false

  defp is_in_range_32_126(n) when n >= 32 and n <= 126, do: true
  defp is_in_range_32_126(_n), do: false

  defp boolean_or_nil(n) when is_boolean(n), do: true
  defp boolean_or_nil(n) when n == nil, do: true
  defp boolean_or_nil(_n), do: false

end
