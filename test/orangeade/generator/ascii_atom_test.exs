defmodule Orangeade.Generator.ASCIIAtomTest do
  use ExUnit.Case
  alias Orangeade.Generator.ASCIIAtom

  test "Check if first 10 generated elements are atoms" do
    list_of_elements =
      ASCIIAtom.stream(max_word_length: 10)
      |> Caffeine.Stream.take(10)

    assert Enum.all?(list_of_elements, &is_atom/1)
  end
end
