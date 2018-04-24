defmodule Orangeade.Generator.TupleTest do
  use ExUnit.Case
  alias Orangeade.Generator.Tuple
  alias Orangeade.Generator.Integer
  alias Orangeade.Generator.Term

  test "Check if first 20 generated elements are tuples" do
    list_of_elements =
      Tuple.stream([Integer.stream(), Term.stream(), Integer.stream()])
      |> Caffeine.Stream.take(20)

    assert Enum.all?(list_of_elements, &is_tuple/1)
  end
end
