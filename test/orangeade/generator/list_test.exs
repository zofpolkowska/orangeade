defmodule Orangeade.Generator.ListTest do
  use ExUnit.Case
  alias Orangeade.Generator.List
  alias Orangeade.Generator.Integer

  test "Check if first 20 generated elements are lists" do
    list_of_elements =
      List.stream(fill: Integer.stream())
      |> Caffeine.Stream.take(20)

    assert Enum.all?(list_of_elements, &is_list/1)
  end
end
