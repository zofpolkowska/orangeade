defmodule Orangeade.Supervisor do
  use Supervisor

  def start_link(start_seed) do
    Supervisor.start_link(__MODULE__, start_seed)
  end

  def init(start_seed) do
    children = [
      %{
        id: SeedState,
        start: {Orangeade.SeedState, :start_link, [[start_seed: start_seed]]}
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
