defmodule Orangeade.Generator.BigNatural do
  alias Psi.LinearCongruentialGenerator, as: LCG

  def stream() do
    LCG.stream(generator: Orangeade.Generator.BigNatural.instance(), seed: 1)
  end

  defmodule LCG.MMIX do
    alias Psi.LinearCongruentialGenerator, as: LCG

    def instance do
      x = %LCG{
        modulus: round(:math.pow(2, 64)),
        multiplier: 6_364_136_223_846_793_005,
        increment: 1_442_695_040_888_963_407
      }

      LCG.instance(x)
    end
  end

  def instance do
    LCG.MMIX.instance()
  end
end
