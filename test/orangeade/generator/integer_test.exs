defmodule Orangeade.Generator.IntegerTest do
  use ExUnit.Case
  alias Orangeade.Generator.Integer

  test "Check if first 10 generated elements are integers" do
    list_of_elements = Integer.stream(limit: 1000)
    |> Caffeine.Stream.take(10)
    assert Enum.all?(list_of_elements, &is_integer/1)
  end

  test "Check if first 10 generated elements are smaller than limit" do
    list_of_elements = Integer.stream(limit: 1000)
    |> Caffeine.Stream.take(10)
    assert Enum.all?(list_of_elements, &(&1 < 1000))
  end
end
