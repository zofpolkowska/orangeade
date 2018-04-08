defmodule Orangeade.Generator.Boolean do
  alias Orangeade.Generator.BoundNatural, as: BoundNatural
  defmodule V1 do
    def stream do
      BoundNatural.stream(limit: 3)
      |> Caffeine.Stream.map(&bool/1)
    end
    
    defp bool(e) do
      cond do
        e === 0 ->
          :true
        e === 1 ->
          :false
        true ->
          :nil
      end
    end
  end

  defmodule V2 do
    def stream do
      stream(:true)
    end
    
    defp stream(e) do
      rest = fn ->
        BoundNatural.stream(limit: 3)
        |> Caffeine.Stream.map(&bool/1) end
      Caffeine.Stream.construct(e, rest)
    end
    
    defp bool(e) do
      cond do
        e === 0 ->
          :true
        e === 1 ->
          :false
        true ->
          :nil
      end
    end
  end
end
