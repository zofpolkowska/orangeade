defmodule Orangeade.Generator.Boolean do
  alias Orangeade.Generator.BoundNatural, as: BoundNatural
  
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
