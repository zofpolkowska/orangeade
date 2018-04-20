defmodule Orangeade.Generator.PrintableASCIICharlist do
  @moduledoc """
  Provides a function for creating a stream of ASCII charlists.
  """

  alias Orangeade.Generator.BoundNatural
  alias Orangeade.Generator.PrintableASCIICharacter

  @doc """
  Creates a stream of ASCII charlists.
  
  ## Examples

      iex(1)> s = Orangeade.Generator.PrintableASCIICharlist.stream(max_word_length: 30)
      ['!' |
      #Function<0.59794914/0 in Orangeade.Generator.PrintableASCIICharlist.make_stream/1>]

      iex(2)> Caffeine.Stream.take(s, 10)
      ['!', 'he@E@?l{$w@7$O:!2[:-LI', 'BG@[&!^7:gp]f% W4S8qjgve,s@#$',
      '}vul?B;(GLGZ_J9Ha>!B', '%8#T]6q^iD[hY"kJM\\-8u4?,-J_:W',
      'V/L=Z]Pi$}deD-.a>wR-', '@u\\O>/0c&Itkh', '!h=rg2/N9r{81&}"74',
      '=^IVK>#<;<mBar#:CnC', '0m\\?6GLeXs$%:c']

  """
  @spec stream([max_word_length: non_neg_integer]) :: Caffeine.Stream.t()
  def stream(max_word_length: l) do
    make_stream(length: BoundNatural.stream(limit: l),
      fill: PrintableASCIICharacter.stream())
  end

  defp make_stream(length: [length | next_length], fill: charlist_stream) do
    {head, reduced_charlist_stream} = drain_chars(length, charlist_stream)
    rest = fn ->
     make_stream(length: next_length.(), fill: reduced_charlist_stream)
    end
    Caffeine.Stream.construct(head, rest)
  end

  defp drain_chars(n, charlist_stream) do
    {Caffeine.Stream.take(charlist_stream, n),
     reduce_stream(n, charlist_stream)}
  end

  defp reduce_stream(0, reduced_stream) do
    reduced_stream
  end
  defp reduce_stream(i, stream) do
    reduce_stream(i - 1, Caffeine.Stream.tail(stream))
  end
end
