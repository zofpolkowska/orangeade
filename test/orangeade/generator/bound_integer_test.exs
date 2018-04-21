defmodule Orangeade.Generator.BoundIntegerTest do
  use ExUnit.Case
  
  test "bound_integer generator should return integers (check 1_000 values)" do
    total = 1_000
    
    integers = Orangeade.Generator.BoundInteger.stream(lower: -200, upper: 200)
    |> Caffeine.Stream.map(fn e -> is_integer(e) end)
    |> Caffeine.Stream.take(total)
    
    assert Enum.all?(integers)
  end
  
  test "the boundinteger generator (upper bound = lower bound) should be uniform" do
    total = 1_000
    epsilon =  :math.log(total)
    
    integers = Caffeine.Stream.take(
      Orangeade.Generator.BoundInteger.stream(lower: -200, upper: 200),
      total)
    
    positive = Enum.count(Enum.filter(integers, fn e -> e > 0 end))
    
    negative = Enum.count(Enum.filter(integers, fn e -> e < 0 end))
    
    assert abs(positive - negative) < epsilon
  end
end
