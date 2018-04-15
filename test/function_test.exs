defmodule FunctionTest do
  use ExUnit.Case

  test "stream should return only functions" do
    funs = Caffeine.Stream.take(
      Orangeade.Generator.Fun.stream(),
      1_000)
    assert Enum.all?(funs, &is_function/1)
  end

  test "stream_named should return tuples {name, arity, function}" do
    funs = Caffeine.Stream.take(
      Orangeade.Generator.Fun.stream_named(),
      1_000)
    assert Enum.all?(funs, fn {name, arity, fun} ->
      is_atom(name) and is_integer(arity) and is_function(fun) end)
  end
end
