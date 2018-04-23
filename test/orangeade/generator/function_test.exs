defmodule Orangeade.Generator.FunctionTest do
  use ExUnit.Case
  test "function generator should return functions" do
    b = Orangeade.Generator.PrintableASCIICharacter.stream() 

    s = Orangeade.Generator.Function.stream(arity: 1, return: b)  

    assert Enum.all?(Caffeine.Stream.take(s, 1_000), &is_function/1)
  end
end
