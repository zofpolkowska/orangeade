defmodule Orangeade.Generator.Fun do
  @defmodule """
  Provides functions to generate streams of functions
  """

  @def """
  Generates a stream of functions from the Kernel module

  # Example
  iex> Caffeine.Stream.take(
  ...> Orangeade.Generator.Fun.stream(),
  ...> 5)
  [#Function<0.126840938/1 in Orangeade.Generator.Fun.f/1>,
  #Function<0.126840938/1 in Orangeade.Generator.Fun.f/1>,
  #Function<0.126840938/1 in Orangeade.Generator.Fun.f/1>,
  #Function<0.126840938/1 in Orangeade.Generator.Fun.f/1>,
  #Function<0.126840938/1 in Orangeade.Generator.Fun.f/1>]
  """
  def stream do
    range = Enum.count(Kernel.__info__(:functions))
    Caffeine.Stream.map(Orangeade.Generator.BoundNatural.stream(limit: range),
      &f/1)
  end

  def stream_named do
    range = Enum.count(Kernel.__info__(:functions))
    Caffeine.Stream.map(Orangeade.Generator.BoundNatural.stream(limit: range),
      &fnamed/1)
  end
  
  defp f(p) do
    {name, _} = Enum.at(Kernel.__info__(:functions), p)
    fn args -> apply(Kernel, name, args) end
  end

  defp fnamed(p) do
    {name, arity} = Enum.at(Kernel.__info__(:functions), p)
    {name, arity, fn args -> apply(Kernel, name, args) end}
  end
  
end
