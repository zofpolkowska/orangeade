defmodule Orangeade.Generator.PrintableASCIICharacter do
  @moduledoc """
  Provides a funcion to generate printable ascii characters
  """

  @doc """
  Generates a stream of printable ascii characters

  # Example
  iex> Caffeine.Stream.take(                        
  ...> Orangeade.Generator.PrintableASCIICharacter.stream(),
  ...> 100)                                         
  '!he@E@?l{$w@7$O:!2[:-LIBG@[&!^7:gp]f% W4S8qjgve,s@#$}vul?B;(GLGZ_J9Ha>!B%8#T]6q^iD[hY"kJM\\-8u4?,-J_:'

  """

  @spec stream() :: Caffeine.Stream.t()
  
  def stream do
    alias Psi.LinearCongruentialGenerator, as: LCG
    
    s = LCG.stream(generator: Orangeade.Generator.BigNatural.instance(), seed: 1)
    Caffeine.Stream.map(s, fn e -> Integer.mod(e, printable()) + lower() end )
  end
  
  defp printable do
    upper() - lower()
  end
  
  defp lower do
    0x20
  end
  
  defp upper do
    0x7E
  end
  
end
