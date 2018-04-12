defmodule Orangeade.Generator.BigNatural.Tests do
  use ExUnit.Case, async: true
  use ExUnitProperties
  import Orangeade.Generator.BigNatural, only: [stream: 0]

  test "check 5 first generated elements" do
    generated =
      stream()
      |> Caffeine.Stream.take(5)

    assert generated == [
             1,
             7_806_831_264_735_756_412,
             9_396_908_728_118_811_419,
             11_960_119_808_228_829_710,
             7_062_582_979_898_595_269
           ]
  end
end
