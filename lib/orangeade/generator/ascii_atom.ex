defmodule Orangeade.Generator.ASCIIAtom do
  @moduledoc """
  Provides a function for creating a stream of ascii atoms.
  """

  alias Orangeade.Generator.PrintableASCIIAlphabetCharacter.Minuscule
  alias Orangeade.Generator.BoundNatural
  
  @doc """
  Creates a stream of ascii atoms of max default length 10.

  ## Examples

  iex> Caffeine.Stream.take(                     
  ...> Orangeade.Generator.ASCIIAtom.stream(),   
  ...> 10)
  [:tmb, :segtesiutk, :x, :voyavicrif, :v, :alkx, :donewenox, :xibmwcxidt, :pemdf,
  :ue]

  """
  @spec stream() :: Caffeine.Stream.t()
  def stream do
    stream(max_word_length: 10)
  end

  @doc """
  Given a max word length creates a stream of ascii atoms.

  ## Examples

  iex> Caffeine.Stream.take(                  
  ...> Orangeade.Generator.ASCIIAtom.stream(max_word_length: 20),
  ...> 10)
  [:segtesiutkt, :oyavicrifx, :v, :lkxv, :ibmwcxidtdonewenoxa, :hyuepemdfx,
  :bweio, :sqdyvvutyvgc, :oasdodrbcnblmeh, :vrssfhhjsvlcbn]


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
