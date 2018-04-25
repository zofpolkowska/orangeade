defmodule Orangeade.Generator.TupleTest do
  use ExUnit.Case
  test "tuple generator should return tuples" do
    a = Orangeade.Generator.Logical.stream()
    b = Orangeade.Generator.BigInteger.stream() 

    t = Orangeade.Generator.Tuple.stream(args: [a,b])

    assert Enum.all?(Caffeine.Stream.take(t, 1_000), &is_tuple/1)
  end
end
