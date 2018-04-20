defmodule PrintableASCIICharacterTest do
  use ExUnit.Case
  alias Orangeade.Generator.PrintableASCIICharacter

  test "First 20 elements are printable ascii characters" do
    list = PrintableASCIICharacter.stream()
    |> Caffeine.Stream.take(20)
    assert List.ascii_printable?(list)
  end
end
