defmodule OrangeadeTest do
  use ExUnit.Case
  alias Orangeade.Generator.BoundNatural, as: BoundNatural
  alias Orangeade.Generator.BoundInteger, as: BoundInteger  
 
  test "API" do
    assert Orangeade.__info__(:functions) == [
             ascii_atom: 0,
             ascii_string: 0,
             big_natural: 0,
             binary: 0,
             boolean_and_nil: 0,
             bound_natural: 1,
             float: 0,
             integer: 0,
             printable_ascii_character: 0,
             printable_ascii_charlist: 0,
             term: 0
           ]

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

    assert Orangeade.Generator.PrintableASCIICharlist.__info__(:functions) == [
             stream: 1
           ]

    assert Orangeade.Generator.ASCIIString.__info__(:functions) == [
             stream: 1
           ]

    assert Orangeade.Generator.ASCIIAtom.__info__(:functions) == [
             stream: 1
           ]

    assert Orangeade.Generator.Binary.__info__(:functions) == [
             stream: 1
           ]

    assert Orangeade.Generator.Integer.__info__(:functions) == [
             stream: 1
           ]

    assert Orangeade.Generator.Float.__info__(:functions) == [
             stream: 1
           ]

    assert Orangeade.Generator.BooleanAndNil.__info__(:functions) == [
             stream: 0
           ]

    assert Orangeade.Generator.Term.__info__(:functions) == [
             stream: 0
           ]
  end

  test "the boundnatural generator should be uniform" do
    boundnaturals = Caffeine.Stream.take(BoundNatural.stream(limit: 100), 100)
    epsilon = 5
    assert abs(Enum.count(boundnaturals, fn x -> x >= 50 end) - 50) < epsilon
  end

  test "the boundinteger generator should be uniform" do
    total = 2_000
    boundintegers = Caffeine.Stream.take(BoundInteger.stream(lower: -100,
	upper: 100), total)
    assert abs(total/2 - Enum.count(boundintegers, fn x -> x > 0 end))/total < 0.05
  end
end
