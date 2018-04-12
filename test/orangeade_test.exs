defmodule OrangeadeTest do
  use ExUnit.Case
  alias Orangeade.Generator.BoundNatural, as: BoundNatural
  alias Orangeade.Generator.Boolean, as: Boolean
  alias Orangeade.Generator.BoundInteger, as: BoundInteger  
 
  test "API" do
    assert Orangeade.__info__(:functions) == [
    ]
    assert Orangeade.Generator.BigNatural.__info__(:functions) == [
      instance: 0
    ]
    assert Orangeade.Generator.BoundNatural.__info__(:functions) == [
      stream: 1
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
    epsilon = 5
    assert abs(total/2 - Enum.count(boundintegers, fn x -> x > 0 end))/total < 0.05
  end

  test "asserts that each of bools occurence is ALMOST equipotencial" do
    total = 50_000
    
    booleans = Caffeine.Stream.take(Boolean.stream(), total)
    trues = Enum.count(Enum.filter(booleans, fn e -> e == :true end))
    falses = Enum.count(Enum.filter(booleans, fn e -> e == :false end))
    nils = Enum.count(Enum.filter(booleans, fn e -> e == :nil end))
    assert trues/total > 0.30
    assert falses/total > 0.30
    assert nils/total > 0.30
  end
end
