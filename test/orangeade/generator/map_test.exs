defmodule Orangeade.Generator.MapTest do
  use ExUnit.Case
  test "map generator should return maps" do
    k = Orangeade.Generator.BoundNatural.stream(limit: 20)
    v = Orangeade.Generator.PrintableASCIICharacter.stream()

    m = Orangeade.Generator.Map.stream(keys: k, values: v, limit: 10)

    assert Enum.all?(Caffeine.Stream.take(m, 1_000), &is_map/1)
  end
end
