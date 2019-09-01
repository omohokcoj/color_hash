defmodule ColorHash do
  @moduledoc ~S"""
  Generate color based on the given string.
  """

  alias ColorHash.{
    BKDR,
    Utils
  }

  @ls [0.35, 0.5, 0.65]

  @spec hsl(String.t(), Keyword.t()) :: list()
  def hsl(string, opts \\ []) do
    hash = BKDR.hash(string)

    la = List.wrap(Keyword.get(opts, :lightness, @ls))
    sa = List.wrap(Keyword.get(opts, :saturation, @ls))

    h = rem(hash, 359)
    s = Enum.at(sa, rem(div(hash, 360), length(sa)))
    l = Enum.at(la, rem(div(hash, 360 * length(sa)), length(la)))

    [h, s, l]
  end

  @spec rgb(String.t(), Keyword.t()) :: list()
  def rgb(string, opts \\ []) do
    string
    |> hsl(opts)
    |> Utils.hsl_to_rgb()
  end

  @spec hex(String.t(), Keyword.t()) :: String.t()
  def hex(string, opts \\ []) do
    string
    |> rgb(opts)
    |> Utils.rgb_to_hex()
  end
end
