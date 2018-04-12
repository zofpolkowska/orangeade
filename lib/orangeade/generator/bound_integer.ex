defmodule Orangeade.Generator.BoundInteger do
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

