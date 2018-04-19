defmodule TupleTest do
  use ExUnit.Case

  test "tuple stream generator should return tuples" do
    t = Caffeine.Stream.take(
      Orangeade.Generator.Tuple.stream(
	Orangeade.Generator.BoundNatural(limit: 10),
	Orangeade.Generator.Printable.ASCII.stream()),
      10)
    assert Enum.all?(t, &is_tuple/1)
  end

  test "tuples consists of the values which given stream generators produce" do
    t = Caffeine.Stream.take(
      Orangeade.Generator.Tuple.stream(
	Orangeade.Generator.BoundInteger(limit: 10),
	Orangeade.Generator.Printable.ASCII.stream()),
      10)
    assert Enum.all?(t, fn {a,b} -> is_integer(a) and List.ascii_printable(b) end)
end
