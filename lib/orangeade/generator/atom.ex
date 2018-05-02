defmodule Orangeade.Generator.Atom do
  @moduledoc """
  Provides a function for creating a stream of ascii atoms.
  """

  alias Orangeade.Generator.PrintableASCIIAlphabetCharacter.Minuscule
  alias Orangeade.Generator.BoundNatural
  
  @doc """
  Creates a stream of ascii atoms of max default length 6.

  ## Examples

  iex> Caffeine.Stream.take(                 
  ...> Orangeade.Generator.Atom.stream(),
  ...> 10)
  [:seg, :icrifx, :v, :voya, :kxv, :enoxal, :new, :xidtdo, :ibmwc, :pemdfx]

  """
  @spec stream() :: Caffeine.Stream.t()
  def stream do
    stream(max_word_length: 6)
  end

  @doc """
  Given a max word length creates a stream of ascii atoms.

  ## Examples

  iex> Caffeine.Stream.take(                                     
  ...> Orangeade.Generator.Atom.stream(max_word_length: 10),
  ...> 10)                                                       
  [:oyavicrif, :oxalkxvv, :wen, :done, :mwcxidt, :mdfxib, :yuepe, :yvgcbweioh,
  :qdyvvut, :hs]

  """
  @spec stream(max_word_length: non_neg_integer) :: Caffeine.Stream.t()
  def stream(max_word_length: l) do
    alphabet = Minuscule.stream()
    lengths = BoundNatural.stream(limit: l)
    stream(alphabet, lengths)
  end

  defp stream(alphabet, lengths) do
    {word, atail} = split(alphabet, Caffeine.Stream.head(lengths))
    rest = fn ->
      stream(atail, Caffeine.Stream.tail(lengths)) end
    Caffeine.Stream.construct(word, rest)
  end

  defp split(alphabet, length) do
    split([], length + 1, alphabet)
  end

  defp split(word, 0, alphabet) do
    {List.to_atom(word), alphabet}
  end

  defp split(word, n, alphabet) do
    split([Caffeine.Stream.head(alphabet)|word], n - 1, Caffeine.Stream.tail(alphabet))
  end
  
end
