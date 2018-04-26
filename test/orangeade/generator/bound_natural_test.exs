defmodule Orangeade.Generator.BoundNaturalTest do
  use ExUnit.Case, async: true
  use ExUnitProperties
  import Orangeade.Generator.BoundNatural, only: [stream: 1]

  property "stream can't contain elements bigger than specified by limit" do
    check all l <- positive_integer() do
      assert stream(limit: l) |> Caffeine.Stream.take(50) |> Enum.max() <= l
    end
  end

  property "sum of generated elements is smaller or equal than multiplied limits" do
    check all l <- positive_integer() do
      assert stream(limit: l) |> Caffeine.Stream.take(50) |> Enum.sum() <= l * 50
    end
  end
end
