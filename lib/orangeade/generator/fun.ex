defmodule Orangeade.Generator.Fun do
  @moduledoc """
  Provides functions to generate streams of functions
  """

  @doc """
  Generates a stream of functions from the Kernel module

  # Example
  iex> [fun | rest] = Caffeine.Stream.take(
  ...> Orangeade.Generator.Fun.stream(),   
  ...> 8)                                  
  [#Function<2.33900811/2 in Orangeade.Generator.Fun.f/1>,
  #Function<2.33900811/2 in Orangeade.Generator.Fun.f/1>,
  #Function<1.33900811/1 in Orangeade.Generator.Fun.f/1>,
  #Function<1.33900811/1 in Orangeade.Generator.Fun.f/1>,
  #Function<1.33900811/1 in Orangeade.Generator.Fun.f/1>,
  #Function<3.33900811/3 in Orangeade.Generator.Fun.f/1>,
  #Function<1.33900811/1 in Orangeade.Generator.Fun.f/1>,
  #Function<2.33900811/2 in Orangeade.Generator.Fun.f/1>]
  iex(19)> i(fun)
  Term
    #Function<2.33900811/2 in Orangeade.Generator.Fun.f/1>
  Data type
    Function
  Type
    local
  Arity
    2
  Description
    This is an anonymous function.
  Implemented protocols
    Enumerable, IEx.Info, Inspect

  """
  def stream do
    range = Enum.count(Kernel.__info__(:functions))
    Caffeine.Stream.map(Orangeade.Generator.BoundNatural.stream(limit: range),
      fn e -> f(Enum.at(Kernel.__info__(:functions), e)) end)
  end

  @doc """
  Generates a stream of Kernel functions with identifiers

  # Example

  iex> Caffeine.Stream.take(                 
  ...> Orangeade.Generator.Fun.stream_named(),
  ...> 4)
  [
    {:!==, 2, #Function<2.33900811/2 in Orangeade.Generator.Fun.f/1>},
    {:>=, 2, #Function<2.33900811/2 in Orangeade.Generator.Fun.f/1>},
    {:spawn_link, 1, #Function<1.33900811/1 in Orangeade.Generator.Fun.f/1>},
    {:is_port, 1, #Function<1.33900811/1 in Orangeade.Generator.Fun.f/1>}
  ]
  """
  def stream_named do
    range = Enum.count(Kernel.__info__(:functions))
    Caffeine.Stream.map(Orangeade.Generator.BoundNatural.stream(limit: range),
      fn e -> fnamed(Enum.at(Kernel.__info__(:functions), e)) end)
  end

  defp f({name, arity}) do
    cond do
      arity === 0 ->
	fn -> apply(Kernel,name, []) end
      arity === 1 ->
	fn e -> apply(Kernel, name, [e]) end
      arity === 2 ->
	fn d, e -> apply(Kernel, name, [d, e]) end
      arity === 3 ->
	fn c, d, e -> apply(Kernel, name, [c, d, e]) end
      true ->
	fn -> "default" end
    end
  end

  defp fnamed({name, arity}) do
    {name, arity, f({name, arity})}
  end

end 

