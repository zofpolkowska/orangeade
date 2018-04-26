defmodule Orangeade.Generator.ListTest do
  use ExUnit.Case

  test "List generator should return lists" do
    args = Orangeade.Generator.Logical.stream()
    lists = Orangeade.Generator.List.stream(args: args, limit: 100)

    res = Caffeine.Stream.take(lists, 1_000)

    assert Enum.all?(res, &is_list/1)
  end

  test "Lists contain values of predicted type" do
    args = Orangeade.Generator.BigInteger.stream()
    lists = Orangeade.Generator.List.stream(args: args, limit: 100)
    
    res = Caffeine.Stream.take(lists, 1_000)

    assert Enum.all?(res, fn e ->
      Enum.all?(e, &is_integer/1) end)
  end
    
end
