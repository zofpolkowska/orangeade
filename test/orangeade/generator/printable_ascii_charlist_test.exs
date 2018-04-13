defmodule PrintableASCIICharlistTest do
  use ExUnit.Case
  alias Orangeade.Generator.PrintableASCIICharlist

  test "Check if first 10 generated elements are lists" do
    list_of_elements = PrintableASCIICharlist.stream(max_word_length: 10)
    |> Caffeine.Stream.take(10)
    assert Enum.all?(list_of_elements, &is_list/1)
  end

  test "Check if length of first 10 elements is lower than max_word_length = 10" do
    list_of_elements = PrintableASCIICharlist.stream(max_word_length: 10)
    |> Caffeine.Stream.take(10)
    assert Enum.all?(list_of_elements, &length_lower_or_equal_10/1)
  end

  defp length_lower_or_equal_10(l) when length(l) <= 10, do: true
  defp length_lower_or_equal_10(_l), do: false 
end
