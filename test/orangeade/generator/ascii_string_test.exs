defmodule ASCIIStringTest do
  use ExUnit.Case
  alias Orangeade.Generator.ASCIIString

  test "Check if first 10 generated elements are bitstrings" do
    list_of_elements = ASCIIString.stream(max_word_length: 10)
    |> Caffeine.Stream.take(10)
    assert Enum.all?(list_of_elements, &String.valid?/1)
  end
end
