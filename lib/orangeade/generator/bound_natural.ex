defmodule Orangeade.Generator.BoundNatural do
  def stream(limit: i) do
    alias Psi.LinearCongruentialGenerator, as: LCG
    alias Orangeade.SeedState

    seed = SeedState.get_next()
    s = LCG.stream(generator: Orangeade.Generator.BigNatural.instance(), seed: seed)
    Caffeine.Stream.map(s, limit(i))
  end

  defp limit(i) do
    fn x ->
      Integer.mod(x, i)
    end
  end
end
