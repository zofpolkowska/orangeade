defmodule Orangeade.SeedStateTest do
  use ExUnit.Case

  alias Orangeade.SeedState

  test "Check if each next seed from get_next/1 is different" do
    list_of_seeds = for _n <- 1..100, do: SeedState.get_next()
    uniq_list_of_seeds = Enum.uniq(list_of_seeds)

    assert list_of_seeds === uniq_list_of_seeds
  end
end
