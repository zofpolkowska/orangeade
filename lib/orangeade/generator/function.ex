defmodule Orangeade.Generator.Function do
  @moduledoc"""
  Provides a function to generate a stream of functions with defined return values and arity
  """

  @doc"""
  Generates a stream of functions from the given arguments and defined arity
  # Example
  iex> a = Orangeade.Generator.Logical.stream()                
      [false | #Function<1.23635164/0 in Caffeine.Stream.map/2>]
  iex> b = Orangeade.Generator.PrintableASCIICharacter.stream()
      [33 | #Function<1.23635164/0 in Caffeine.Stream.map/2>]
  iex> c = Orangeade.Generator.BoundNatural.stream(limit: 13)  
      [1 | #Function<1.23635164/0 in Caffeine.Stream.map/2>]
  iex> s = Orangeade.Generator.Function.stream(arity: 0, return: a)
      [#Function<5.18620219/0 in Orangeade.Generator.Function.f/2> |
       #Function<7.18620219/0 in Orangeade.Generator.Function.stream/1>]
  iex> f = Caffeine.Stream.head(s)                                 
      #Function<5.18620219/0 in Orangeade.Generator.Function.f/2>
  iex> f.()                                                        
      false
  iex> s = Orangeade.Generator.Function.stream(arity: 1, return: b) 
      [#Function<1.18620219/1 in Orangeade.Generator.Function.f/2> |
       #Function<7.18620219/0 in Orangeade.Generator.Function.stream/1>]
  iex> f = Caffeine.Stream.head(s)                                  
      #Function<1.18620219/1 in Orangeade.Generator.Function.f/2>
  iex> f.(1)                                                        
      '!'

  """
  
  @spec stream([arity: non_neg_integer, return: Caffeine.Stream.t()]) :: Caffeine.Stream.t()
  
  def stream(arity: a, return: r) do
    function = f(a, fst(r))
    rest = fn ->
      stream(arity: a, return: Caffeine.Stream.tail(r)) end
    Caffeine.Stream.construct(function, rest)
  end

  defp f(arity, return) do
    case arity do
      0 ->
	fn -> return end
      1 ->
	fn _x -> return end
      2 ->
	fn _x, _y -> return end
      3 ->
	fn _x, _y, _z -> return end
      4 ->
	fn _w, _x, _y, _z -> return end
      5 ->
	fn _u, _w, _x, _y, _z -> return end
      _ ->
	fn -> "to big number of arguments" end
    end
  end

  defp fst(s) do
    e = Caffeine.Stream.take(s, 1)
    cond do
      List.ascii_printable?(e) ->
	e
      true ->
	hd(e)
    end
  end
end
