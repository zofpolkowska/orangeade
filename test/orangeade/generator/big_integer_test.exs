defmodule  Orangeade.Generator.BigIntegerTest do
  use ExUnit.Case

  test "big_integer generator should return integers (check 1_000 values)" do
    total = 1_000
    integers = Orangeade.Generator.BigInteger.stream()
    |> Caffeine.Stream.map(fn e -> is_integer(e) end)
    |> Caffeine.Stream.take(total)
    
    assert Enum.all?(integers)
  end

  test "number of positive and negative values should be almost the same" do
    total = 1_000
    epsilon =  :math.log(total)
    
    integers = Caffeine.Stream.take(
      Orangeade.Generator.BigInteger.stream(),
      total)
    
    positive = Enum.count(Enum.filter(integers, fn e -> e > 0 end))
      
    negative = Enum.count(Enum.filter(integers, fn e -> e < 0 end))

    assert abs(positive - negative) < epsilon
  end
end
