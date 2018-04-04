defmodule Orangeade.Generator.BigNatural do
  defmodule LCG.MMIX do
    alias Psi.LinearCongruentialGenerator, as: LCG

    def instance do
      x = %LCG{
        modulus:    round(:math.pow(2, 64)),
        multiplier: 6364136223846793005,
        increment:  1442695040888963407
      }
      LCG.instance(x)
    end
  end

  def instance do
    LCG.MMIX.instance()
  end
end
