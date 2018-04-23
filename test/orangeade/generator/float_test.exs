defmodule Orangeade.Generator.FLoatTest do
  use ExUnit.Case
  alias Orangeade.Generator.Float

  test "Check if first 10 generated elements are floats" do
    list_of_elements = Float.stream(limit: 1000, fraction_digits_limit: 5)
    |> Caffeine.Stream.take(10)
    assert Enum.all?(list_of_elements, &is_float/1)
  end

  test "Check if first 10 generated elements are smaller than limit" do
    list_of_elements = Float.stream(limit: 1000, fraction_digits_limit: 5)
    |> Caffeine.Stream.take(10)
    assert Enum.all?(list_of_elements, &(&1 < 1000))
  end
end
