defmodule Orangeade do
  use Application

  @moduledoc """
  A collection of data generators (like those seen in property-based testing)
  """

  alias Orangeade.Generator, as: Gen

  defdelegate ascii_atom(), to: Gen.ASCIIAtom, as: :stream
  defdelegate ascii_string(), to: Gen.ASCIIString, as: :stream
  defdelegate binary(), to: Gen.Binary, as: :stream
  defdelegate boolean_and_nil(), to: Gen.BooleanAndNil, as: :stream
  defdelegate big_natural, to: Gen.BigNatural, as: :stream
  defdelegate bound_natural(limit), to: Gen.BoundNatural, as: :stream
  defdelegate float(), to: Gen.Float, as: :stream
  defdelegate integer(), to: Gen.Integer, as: :stream
  defdelegate printable_ascii_character(), to: Gen.PrintableASCIICharacter, as: :stream
  defdelegate printable_ascii_charlist(), to: Gen.PrintableASCIICharlist, as: :stream
  defdelegate term(), to: Gen.Term, as: :stream

  def start(_type, _args) do
    Orangeade.Supervisor.start_link(1)
  end
end
