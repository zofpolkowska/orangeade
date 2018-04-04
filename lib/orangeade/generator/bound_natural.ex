defmodule Orangeade.Generator.BoundNatural do
  def stream(limit: i) do
    alias Psi.LinearCongruentialGenerator, as: LCG

    s = LCG.stream(generator: Orangeade.Generator.BigNatural.instance(), seed: 1)
    Caffeine.Stream.map(s, limit(i))
  end

  defp limit(i) do
    fn x ->
      Integer.mod(x, i)
    end
  end
end
