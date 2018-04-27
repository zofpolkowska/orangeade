defmodule Orangeade do
  use Application

  @moduledoc """
  A collection of data generators (like those seen in property-based testing)
  """

  alias Orangeade.Generator, as: Gen

  def start(_type, _args) do
    Orangeade.Supervisor.start_link(1)
  end

  defdelegate ascii_atom(), to: Gen.ASCIIAtom, as: :stream
  defdelegate ascii_string(), to: Gen.ASCIIString, as: :stream
  defdelegate big_integer(opts), to: Gen.BigInteger, as: :stream
  defdelegate big_natural(), to: Gen.BigNatural, as: :stream
  defdelegate big_natural_instance(), to: Gen.BigNatural, as: :instance
  defdelegate binary(), to: Gen.Binary, as: :stream
  defdelegate boolean_and_nil(), to: Gen.BooleanAndNil, as: :stream
  defdelegate bound_integer(opts), to: Gen.BoundInteger, as: :stream
  defdelegate bound_natural(limit), to: Gen.BoundNatural, as: :stream
  defdelegate float(), to: Gen.Float, as: :stream
  defdelegate function(opts), to: Gen.Function, as: :stream
  defdelegate integer(), to: Gen.Integer, as: :stream
  defdelegate list(opts), to: Gen.List, as: :stream
  defdelegate logical(), to: Gen.Logical, as: :stream
  defdelegate map(opts), to: Gen.Map, as: :stream
  defdelegate printable_ascii_character(), to: Gen.PrintableASCIICharacter, as: :stream
  defdelegate printable_ascii_charlist(), to: Gen.PrintableASCIICharlist, as: :stream
  defdelegate term(), to: Gen.Term, as: :stream
  defdelegate tuple(stream_list), to: Gen.Tuple, as: :stream
end
