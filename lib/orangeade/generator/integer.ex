defmodule Orangeade.Generator.Integer do
  def stream do
     alias Psi.LinearCongruentialGenerator, as: LCG
    
    s = LCG.stream(generator: Orangeade.Generator.BigNatural.instance(), seed: 1)
    e = Orangeade.Generator.BoundNatural.stream(limit: 2)
    stream(s, e)
  end

  defp stream(s, e) do
    si = Caffeine.Stream.head(s)
    ei = Caffeine.Stream.head(e)
    Caffeine.Stream.construct( f(si,ei),
      fn -> stream(Caffeine.Stream.tail(s), Caffeine.Stream.tail(e)) end)
  end

  defp f(si, ei) do
    cond do
      ei === 0 ->
	si *(-1)
      true ->
	si
    end
  end
  
end
