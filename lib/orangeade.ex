defmodule Orangeade do
  @moduledoc """
  A collection of data generators (like those seen in property-based testing)
  """
  alias Orangeade.Generator, as: Gen

  defdelegate gen_ascii_atom_stream(), to: Gen.ASCIIAtom, as: :stream
  defdelegate gen_ascii_atom_stream(opts), to: Gen.ASCIIAtom, as: :stream
  defdelegate gen_ascii_string_stream(), to: Gen.ASCIIString, as: :stream
  defdelegate gen_ascii_string_stream(opts), to: Gen.ASCIIString, as: :stream
  defdelegate gen_big_integer_stream(), to: Gen.BigInteger, as: :stream
  defdelegate gen_big_natural_stream(), to: Gen.BigNatural, as: :stream
  defdelegate gen_big_natural_instance(), to: Gen.BigNatural, as: :instance
  defdelegate gen_binary_stream(), to: Gen.Binary, as: :stream
  defdelegate gen_binary_stream(opts), to: Gen.Binary, as: :stream
  defdelegate gen_boolean_and_nil_stream(), to: Gen.BooleanAndNil, as: :stream
  defdelegate gen_bound_integer_stream(opts), to: Gen.BoundInteger, as: :stream
  defdelegate gen_bound_natural_stream(opts), to: Gen.BoundNatural, as: :stream
  defdelegate gen_float_stream(), to: Gen.Float, as: :stream
  defdelegate gen_float_stream(opts), to: Gen.Float, as: :stream
  defdelegate gen_function_stream(opts), to: Gen.Function, as: :stream
  defdelegate gen_integer_stream(), to: Gen.Integer, as: :stream
  defdelegate gen_integer_stream(opts), to: Gen.Integer, as: :stream
  defdelegate gen_list_stream(opts), to: Gen.List, as: :stream
  defdelegate gen_logical_stream(), to: Gen.Logical, as: :stream
  defdelegate gen_map_stream(opts), to: Gen.Map, as: :stream
  defdelegate gen_printable_ascii_character_stream(), to: Gen.PrintableASCIICharacter, as: :stream
  defdelegate gen_printable_ascii_charlist_stream(), to: Gen.PrintableASCIICharlist, as: :stream
  defdelegate gen_printable_ascii_charlist_stream(opts), to: Gen.PrintableASCIICharlist, as: :stream
  defdelegate gen_term_stream(), to: Gen.Term, as: :stream
  defdelegate gen_tuple_stream(opts), to: Gen.Tuple, as: :stream
end
