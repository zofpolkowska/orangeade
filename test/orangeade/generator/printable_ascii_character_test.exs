defmodule Orangeade.Generator.PrintableASCIICharacterTest do
  use ExUnit.Case
  test "only printable ascii characters are generated" do
    s = Caffeine.Stream.take(                    
      Orangeade.Generator.PrintableASCIICharacter.stream(),
      1_000)
    assert List.ascii_printable?(s)
  end
end
