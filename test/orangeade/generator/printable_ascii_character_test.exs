defmodule PrintableASCIICharacterTest do
  use ExUnit.Case
  alias Orangeade.Generator.PrintableASCIICharacter

  test "First 20 ascii numbers are in the range <32, 126>" do
    charlist = PrintableASCIICharacter.stream()
    |> Caffeine.Stream.take(20)
    assert Enum.all?(charlist, &is_in_range/1)
  end

  defp is_in_range(n) when n >= 32 and n <= 126, do: true
  defp is_in_range(_n), do: false
end
