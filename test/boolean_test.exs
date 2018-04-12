defmodule BooleanTest do
  use ExUnit.Case
  alias Orangeade.Generator.Boolean, as: Boolean
  
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
