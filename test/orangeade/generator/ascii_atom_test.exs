defmodule Orangeade.Generator.ASCIIAtomTest do
  use ExUnit.Case
  alias Orangeade.Generator.ASCIIAtom

  test "Check if first 10 generated elements are atoms" do
    list_of_elements =
      ASCIIAtom.stream()
      |> Caffeine.Stream.take(10)

    assert Enum.all?(list_of_elements, &is_atom/1)
  end

  test "Check if atoms have default max word length not greater than 6" do
    lengths_of_elements =
      ASCIIAtom.stream()
      |> Caffeine.Stream.take(10)
      |> Enum.map(&Atom.to_charlist/1)
      |> Enum.map(&length/1)

    refute Enum.any?(lengths_of_elements,fn e -> e > 6 end) 
  end
end
