defmodule Orangeade.SeedState do
  use Agent

  alias Psi.LinearCongruentialGenerator, as: LCG

  @doc """
  Starts a new seed state which is a big natural numbers stream which is created
  with start_seed passed by supervisor.
  """
  def start_link(start_seed: start_seed) do
    Agent.start_link(
      fn ->
        LCG.stream(
          generator: Orangeade.Generator.BigNatural.instance(),
          seed: start_seed
        )
      end,
      name: __MODULE__
    )
  end

  @doc """
  Gets a next seed from the state and updates it.
  """
  def get_next do
    Agent.get_and_update(__MODULE__, &return_and_update/1)
  end

  defp return_and_update(seed_stream) do
    {Caffeine.Stream.head(seed_stream), Caffeine.Stream.tail(seed_stream)}
  end
end
