defmodule Orangeade.Generator.PrintableASCIIAlphabetCharacterTest do
  use ExUnit.Case
  
  test "Stream contains only alphabet characters" do
    list = Orangeade.Generator.PrintableASCIIAlphabetCharacter.stream()
    |> Caffeine.Stream.take(1_000)

    refute Enum.any?(list, fn e ->
      e < ?A or (e > ?Z and e < ?a) or e > ?z end)      
  end

  test "Majuscule stream contains only uppercase characters" do
    {min, max} = Orangeade.Generator.PrintableASCIIAlphabetCharacter.Majuscule.stream()
    |> Caffeine.Stream.take(1_000)
    |> Enum.min_max

    assert (?A <= min) and (max <= ?Z)
  end

  
  test "Minuscule stream contains only lowercase characters" do
    {min, max} = Orangeade.Generator.PrintableASCIIAlphabetCharacter.Minuscule.stream()
    |> Caffeine.Stream.take(1_000)
    |> Enum.min_max

    assert (?a <= min) and (max <= ?z)
  end
  
end
