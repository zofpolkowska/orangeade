defmodule OrangeadeTest do
  use ExUnit.Case

  test "API" do
    assert Orangeade.__info__(:functions) == []

    assert Orangeade.Generator.BigNatural.__info__(:functions) == [
             instance: 0,
             stream: 0
           ]

    assert Orangeade.Generator.BoundNatural.__info__(:functions) == [
             stream: 1
           ]
    assert Orangeade.Generator.PrintableASCIICharacter.__info__(:functions) == [
             stream: 0
           ]
  end
end
