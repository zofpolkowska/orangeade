defmodule Orangeade.Generator.BigNaturalTest do
  use ExUnit.Case, async: true
  import Orangeade.Generator.BigNatural, only: [stream: 0]

  test "check 5 first generated elements" do
    generated = Caffeine.Stream.take(stream(), 5)

    assert generated == [
             1,
             7_806_831_264_735_756_412,
             9_396_908_728_118_811_419,
             11_960_119_808_228_829_710,
             7_062_582_979_898_595_269
           ]
  end
end
