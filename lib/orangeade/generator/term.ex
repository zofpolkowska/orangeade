defmodule Orangeade.Generator.Term do
  @moduledoc """
  Provides a function for creating a stream of terms.
  """

  alias Orangeade.Generator.BoundNatural
  alias Orangeade.Generator.PrintableASCIICharacter
  alias Orangeade.Generator.PrintableASCIICharlist
  alias Orangeade.Generator.ASCIIAtom
  alias Orangeade.Generator.ASCIIString
  alias Orangeade.Generator.Binary
  alias Orangeade.Generator.Integer
  alias Orangeade.Generator.Float
  alias Orangeade.Generator.BooleanAndNil

  @doc """
  Creates a stream of terms.

  ## Examples

      iex(1)> s = Orangeade.Generator.Term.stream
      ['!' | #Function<0.35028165/0 in Orangeade.Generator.Term.do_stream/1>]

      iex(2)> Caffeine.Stream.take(s, 10) 
      [
        '!',
        <<1>>,
        "!",
        -0.99999,
        -1,
        33,
        false,
        :!,
        'he@E@?l{$w@7',
        <<124, 27, 14, 197, 240, 127, 162, 201, 164, 35, 118, 13>>
      ]

  """
  @spec stream() :: nonempty_improper_list(term, (() -> term))
  def stream do
    number_of_generators = 8
    streams_list = [
      PrintableASCIICharacter.stream,
      PrintableASCIICharlist.stream(max_word_length: 40),
      ASCIIAtom.stream(max_word_length: 20),
      ASCIIString.stream(max_word_length: 40),
      Binary.stream(byte_size_limit: 20),
      Integer.stream(limit: 100000),
      Float.stream(limit: 100000, fraction_digits_limit: 5),
      BooleanAndNil.stream
    ]
    do_stream(data_type: BoundNatural.stream(limit: number_of_generators),
      fill: streams_list)
  end

  defp do_stream(data_type: [type | next_type], fill: streams_list) do
    {head, reduced_streams_list} = drain_streams_list(type, streams_list)
    rest = fn ->
      do_stream(data_type: next_type.(), fill: reduced_streams_list)
    end
    Caffeine.Stream.construct(head, rest)
  end

  defp drain_streams_list(type, streams_list) do
    [head | _tail] = Enum.at(streams_list, type)
    {head, List.update_at(streams_list, type, &Caffeine.Stream.tail/1)}
  end
end
