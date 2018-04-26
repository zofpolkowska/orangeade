defmodule Orangeade.Generator.LogicalTest do
  use ExUnit.Case
  alias Orangeade.Generator.Logical

  test "asserts that each of bools occurence is ALMOST equipotencial" do
    total = 50_000

    vals = Caffeine.Stream.take(Logical.stream(), total)

    trues = Enum.count(Enum.filter(vals, fn e -> e == true end))
    falses = Enum.count(Enum.filter(vals, fn e -> e == false end))
    nils = Enum.count(Enum.filter(vals, fn e -> e == nil end))

    assert trues / total > 0.30
    assert falses / total > 0.30
    assert nils / total > 0.30
  end
end
