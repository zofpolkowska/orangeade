defmodule OrangeadeTest do
  use ExUnit.Case

  test "API" do
    assert Orangeade.__info__(:functions) == [
             gen_ascii_atom_stream: 0,
             gen_ascii_atom_stream: 1,
             gen_ascii_string_stream: 0,
             gen_ascii_string_stream: 1,
             gen_big_integer_stream: 0,
             gen_big_natural_instance: 0,
             gen_big_natural_stream: 0,
             gen_binary_stream: 0,
             gen_binary_stream: 1,
             gen_boolean_and_nil_stream: 0,
             gen_bound_integer_stream: 1,
             gen_bound_natural_stream: 1,
             gen_float_stream: 0,
             gen_float_stream: 1,
             gen_function_stream: 1,
             gen_integer_stream: 0,
             gen_integer_stream: 1,
             gen_list_stream: 1,
             gen_logical_stream: 0,
             gen_map_stream: 1,
             gen_printable_ascii_character_stream: 0,
             gen_printable_ascii_charlist_stream: 0,
             gen_printable_ascii_charlist_stream: 1,
             gen_term_stream: 0,
             gen_tuple_stream: 1
           ]

    assert Orangeade.Generator.BigNatural.__info__(:functions) == [
             instance: 0,
             stream: 0
           ]

    assert Orangeade.Generator.BoundNatural.__info__(:functions) == [
             stream: 1
           ]

    assert Orangeade.Generator.PrintableASCIICharacter.__info__(:functions) == [
             stream: 0
           ]

    assert Orangeade.Generator.PrintableASCIICharlist.__info__(:functions) == [
             stream: 0,
             stream: 1
           ]

    assert Orangeade.Generator.ASCIIString.__info__(:functions) == [
             stream: 0,
             stream: 1
           ]

    assert Orangeade.Generator.ASCIIAtom.__info__(:functions) == [
             stream: 0,
             stream: 1
           ]

    assert Orangeade.Generator.Binary.__info__(:functions) == [
             stream: 0,
             stream: 1
           ]

    assert Orangeade.Generator.Integer.__info__(:functions) == [
             stream: 0,
             stream: 1
           ]

    assert Orangeade.Generator.Float.__info__(:functions) == [
             stream: 0,
             stream: 1
           ]

    assert Orangeade.Generator.BooleanAndNil.__info__(:functions) == [
             stream: 0
           ]

    assert Orangeade.Generator.Term.__info__(:functions) == [
             stream: 0
           ]

    assert Orangeade.Generator.List.__info__(:functions) == [
             stream: 1
           ]

    assert Orangeade.Generator.Tuple.__info__(:functions) == [
             stream: 1
           ]
  end
end
