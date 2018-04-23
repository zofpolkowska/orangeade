defmodule Orangeade.Generator.BinaryTest do
  use ExUnit.Case
  alias Orangeade.Generator.Binary

  test "Check if the first 10 generated elements are binaries" do
    list_of_elements =
      Binary.stream(byte_size_limit: 20)
      |> Caffeine.Stream.take(10)

    assert Enum.all?(list_of_elements, &is_binary/1)
  end

  test "Check if byte size of the first 100 elements is lower than given size" do
    list_of_elements =
      Binary.stream(byte_size_limit: 10)
      |> Caffeine.Stream.take(100)

    assert Enum.all?(list_of_elements, &size_lower_10/1)
  end

  defp size_lower_10(b) when byte_size(b) < 10, do: true
  defp size_lower_10(_b), do: false
end
