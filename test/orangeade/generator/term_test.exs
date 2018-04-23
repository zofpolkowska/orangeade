defmodule Orangeade.Generator.TermTest do
  use ExUnit.Case
  alias Orangeade.Generator.Term

  test "Check if there are different data types in first 100 generated elements" do
    list_of_elements =
      Term.stream()
      |> Caffeine.Stream.take(100)

    list_of_conditions = [
      Enum.any?(list_of_elements, &is_negative/1),
      Enum.any?(list_of_elements, &List.ascii_printable?/1),
      Enum.any?(list_of_elements, &is_atom/1),
      Enum.any?(list_of_elements, &is_binary/1),
      Enum.any?(list_of_elements, &is_integer/1),
      Enum.any?(list_of_elements, &is_float/1),
      Enum.any?(list_of_elements, &is_boolean/1),
      Enum.any?(list_of_elements, &is_nil/1)
    ]

    assert Enum.all?(list_of_conditions)
  end

  defp is_negative(n) when n < 0, do: true
  defp is_negative(_n), do: false
end
