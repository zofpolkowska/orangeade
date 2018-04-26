defmodule Orangeade.Generator.BigInteger do
  @moduledoc """
  Provides a function to generate a stream of integers
  """

  @doc """
  Generates a stream of integers

  # Example

  iex> Caffeine.Stream.take(                                    
  ...> Orangeade.Generator.BigInteger.stream(),
  ...> 20)                                     
  [3, -2088359638719790806, 5991960103029929709, -13547870596056087544,
  6385483684110717927, -11420225309123238378, 7006342384400164209,
  -9289510677130798380, 8933741621175524875, -10211955533338721854,
  12952655938206184501, -17906108326264568224, 16175701042954945135,
  -4681242023754186706, 13955619279316412217, -16688202270397885780,
  15760131196233180435, -4559306894362948262, 14149109876543242877,
  -8155322449589351496]

  """

  @spec stream() :: Caffeine.Stream.t()

  def stream do
    alias Psi.LinearCongruentialGenerator, as: LCG

    s = LCG.stream(generator: Orangeade.Generator.BigNatural.instance(), seed: 1)
    e = Orangeade.Generator.BoundNatural.stream(limit: 2)
    stream(s, e)
  end

  defp stream(s, e) do
    si = Caffeine.Stream.head(s)
    ei = Caffeine.Stream.head(e)

    Caffeine.Stream.construct(f(si, ei), fn ->
      stream(Caffeine.Stream.tail(s), Caffeine.Stream.tail(e))
    end)
  end

  defp f(si, ei) do
    cond do
      ei === 0 ->
        si * -1

      ei === 1 ->
        si
    end
  end
end
