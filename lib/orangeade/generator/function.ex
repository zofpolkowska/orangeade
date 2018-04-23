defmodule Orangeade.Generator.Function do
  @moduledoc """
  Provides a function for creating a stream of functions.
  """

  alias Orangeade.Generator.BoundNatural
  alias Orangeade.Generator.Term

  @doc """
  Creates a stream of functions with different arity. Functions return pseudo
  random generated term().

  ## Examples



  """
  @spec stream(arity_limit: non_neg_integer) ::
          nonempty_improper_list((... -> term()), (() -> (... -> term())))
  def stream(arity_limit: l) do
    do_stream(arity_limit: BoundNatural.stream(limit: l), fill: Term.stream())
  end

  defp do_stream(arity_limit: [arity | next_arity], fill: [term | next_term]) do
    head = create_function(arity, term)

    rest = fn ->
      do_stream(arity_limit: next_arity.(), fill: next_term.())
    end

    Caffeine.Stream.construct(head, rest)
  end

  defp create_function(arity, term) do
    fn arity -> term end
  end
end
