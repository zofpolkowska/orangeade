defmodule OrangeadeTest do
  use ExUnit.Case
  alias Orangeade.Generator.BoundNatural, as: BoundNatural
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
    assert abs(total/2 - Enum.count(boundintegers, fn x -> x > 0 end))/total < 0.05
  end
end
