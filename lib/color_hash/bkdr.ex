defmodule ColorHash.BKDR do
  @moduledoc ~S"""
  https://www.partow.net/programming/hashfunctions/#BKDRHashFunction
  https://github.com/zenozeng/color-hash/blob/master/lib/bkdr-hash.js
  """

  @seed 131
  @seed2 137
  @max_integer 9_007_199_254_740_991 / @seed2

  @spec hash(String.t()) :: integer()
  def hash(string) do
    string
    |> Kernel.<>("x")
    |> String.to_charlist()
    |> Enum.reduce(0, fn char, hash ->
      case hash > @max_integer do
        true -> div(hash, @seed2) * @seed + char
        _ -> hash * @seed + char
      end
    end)
  end
end
