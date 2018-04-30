defmodule Orangeade.Generator.PrintableASCIIAphabetCharacter do
  @moduledoc """
  Provides a function for creating a stream of ASCII alphabet characters.
  """
  alias Caffeine.Stream
  alias Orangeade.Generator.BoundNatural
  alias Orangeade.Generator.PrintableASCIIAlphabetCharacter.Majuscule
  alias Orangeade.Generator.PrintableASCIIAlphabetCharacter.Minuscule

  defmodule Majuscule do
    @doc """
    Creates a stream of ASCII alphabet lowercase characters

    # Example

    iex> Caffeine.Stream.take(                                                 
    ...> Orangeade.Generator.PrintableASCIIAphabetCharacter.Majuscule.stream(),
    ...> 50)                                                                  
    'XONEWENODTDIXCWMBIXFDMEPEUYHOIEWBCGVYTUVVYDQSHEMLB'

    """
    @spec stream() :: Caffeine.Stream.t()
    def stream do
      Caffeine.Stream.map(BoundNatural.stream(limit: length()), &to_majuscule/1)
    end

    defp to_majuscule(n) do
      n + lower_bound()
    end

    defp length do
      upper_bound() - lower_bound()
    end

    def lower_bound do
      ?A
    end

    defp upper_bound do
      ?Z
    end
  end

  defmodule Minuscule do
    @doc """
    Creates a stream of ASCII alphabet lowercase characters
  
    # Example
    iex> Caffeine.Stream.take(                                                 
    ...> Orangeade.Generator.PrintableASCIIAphabetCharacter.Minuscule.stream(),
    ...> 50)
    'onewenodtdixcwmbixfdmepeuyhoiewbcgvytuvvydqshemlbn'


    """
    @spec stream() :: Caffeine.Stream.t()
    def stream do
      Caffeine.Stream.map(BoundNatural.stream(limit: length()), &to_minuscule/1)
    end

    defp to_minuscule(n) do
      n + lower_bound()
    end

    def length do
      upper_bound() - lower_bound()
    end

    def lower_bound do
      ?a
    end

    defp upper_bound do
      ?z
    end
  end

  @doc """
  Creates a stream of ASCII alphabet characters
  
  # Example
  iex> Caffeine.Stream.take(                                             
  ...> Orangeade.Generator.PrintableASCIIAphabetCharacter.stream(),      
  ...> 50)                                                               
  'NeWeNoDtDiXcWmBiXfDmEpEuYhOiEwBcGvYtUvVyDqShEmLbNc'


  """
  
  @spec stream() :: Caffeine.Stream.t()
  def stream do
    base = BoundNatural.stream(limit: length())
    filter = BoundNatural.stream(limit: 2)
    stream(base, filter)
  end

  defp stream(base, filter) do
    head = to_alphabet_character(Stream.head(base), Stream.head(filter))
    rest = fn -> stream(Stream.tail(base),Stream.tail(filter)) end
    Caffeine.Stream.construct(head, rest)
  end

  defp to_alphabet_character(base, filter) do
    case filter do
      1 ->
	base + Majuscule.lower_bound()
      0 ->
	base + Minuscule.lower_bound()
    end
  end

  defp length do
    Minuscule.length()
  end

  

end
