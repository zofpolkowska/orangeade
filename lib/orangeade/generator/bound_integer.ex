defmodule Orangeade.Generator.BoundInteger do
  @moduledoc """
  Provides a function to generate a limited stream of integers
  """
  
  @doc """
  Generates a limited stream of integers

  # Example
  iex> Caffeine.Stream.take(                                        
  ...> Orangeade.Generator.BoundInteger.stream(lower: -200, upper: 200),
  ...> 14)                                                              
  [1, -12, 19, -110, 69, -120, 183, -18, 129, -44, 131, -54, 93, -48]

  """
  def stream(lower: i, upper: j) do
    l = Orangeade.Generator.BoundNatural.stream(limit: abs(i))
    u = Orangeade.Generator.BoundNatural.stream(limit: j)
    e = Orangeade.Generator.BoundNatural.stream(limit: 2)
    stream(l, u, e)
  end

  defp stream(l, u, e) do
    li = Caffeine.Stream.head(l)
    ui = Caffeine.Stream.head(u)
    ei = Caffeine.Stream.head(e)
    Caffeine.Stream.construct(f(li,ui,ei), fn ->
      stream(Caffeine.Stream.tail(l),
	Caffeine.Stream.tail(u),
	Caffeine.Stream.tail(e)) end)
  end

  defp f(li, ui, ei) do
    cond do
      ei === 0 ->
	ui *(-1)
      ei === 1 ->
	li
    end
  end
  
end

