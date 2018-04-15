defmodule Orangeade.Generator.ASCIIString do
  @moduledoc """
  Provides a function for creating a stream of ascii strings.
  """

  alias Orangeade.Generator.PrintableASCIICharlist

  @doc """
  Given a max word length creates a stream of ascii strings.
  
  ## Examples

      iex(1)> s = Orangeade.Generator.ASCIIString.stream(max_word_length: 20)
      ["!" | #Function<1.23635164/0 in Caffeine.Stream.map/2>]

      iex(2)> Caffeine.Stream.take(s, 10)
      ["!", "he@E@?l{$w@7", "$O:!2[:-LIBG@[&!^7:", "gp]f% W4S8", "qjgve,s@#", "",
      "$}v", "ul?B;(GLGZ_J9Ha>!B", "%8#T]6q^i", "D[hY"]

  """
  @spec stream([max_word_length: non_neg_integer]) ::
          nonempty_improper_list(bitstring, (() -> bitstring))
  def stream(max_word_length: l) do
    Caffeine.Stream.map(PrintableASCIICharlist.stream(max_word_length: l),
      &List.to_string/1)
  end
end
