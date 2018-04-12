defmodule Orangeade.Generator.Printable.ASCII do
  alias Orangeade.Generator.BigNatural
  defmodule V1 do
    def stream do
      Caffeine.Stream.map(BigNatural.instance(),
	fn e -> Integer.mod(e, printable()) end)
    end

    def printable do
      0x7E - 0x20
    end
  end

end
