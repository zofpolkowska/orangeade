defmodule IntegerTest do
  use ExUnit.Case

  test "big_integer generator should return integers (check 1_000 values" do
    integers = Orangeade.Generator.BigInteger.stream()
    |> Caffeine.Stream.map(fn e -> is_integer(e) end)
    |> Caffeine.Stream.take(1_000)
    assert Enum.all?(integers)
  end

  test "number of positive and negative values should be almost the same" do
    integers = Orangeade.Generator.BigInteger.stream()
    |> Caffeine.Stream.take(1_000)
    positive = Enum.count(Enum.filter(integers, fn e -> e > 0 end))
    negative = Enum.count(Enum.filter(integers, fn e -> e < 0 end))
    assert abs(positive - negative) < 5
  end

  test "bound_integer generator should return integers (check 1_000 values" do
    integers = Orangeade.Generator.BoundInteger.stream(lower: -200, upper: 200)
    |> Caffeine.Stream.map(fn e -> is_integer(e) end)
    |> Caffeine.Stream.take(1_000)
    assert Enum.all?(integers)
  end

  test "number of positive and negative equally limited values should be almost the same" do
    integers = Orangeade.Generator.BoundInteger.stream(lower: -200, upper: 200)
    |> Caffeine.Stream.take(1_000)
    positive = Enum.count(Enum.filter(integers, fn e -> e > 0 end))
    negative = Enum.count(Enum.filter(integers, fn e -> e < 0 end))
    assert abs(positive - negative) < 5
  end
  
end
