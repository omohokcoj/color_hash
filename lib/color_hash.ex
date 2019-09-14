defmodule ColorHash do
  @moduledoc ~S"""
  Generate color based on the given string.
  """

  alias ColorHash.{
    BKDR,
    Utils
  }

  @defaults [35, 50, 65]

  @type options :: [
          {:lightness, Range.t() | list() | integer()}
          | {:saturation, Range.t() | list() | integer()}
        ]

  @spec hsl(String.t(), options()) :: list()
  def hsl(string, opts \\ []) do
    hash = BKDR.hash(string)

    la = get_option(opts, :lightness)
    sa = get_option(opts, :saturation)

    h = rem(hash, 359)
    s = Enum.at(sa, rem(div(hash, 360), length(sa))) / 100
    l = Enum.at(la, rem(div(hash, 360 * length(sa)), length(la))) / 100

    [h, s, l]
  end

  @spec rgb(String.t(), options()) :: list()
  def rgb(string, opts \\ []) do
    string
    |> hsl(opts)
    |> Utils.hsl_to_rgb()
  end

  @spec hex(String.t(), options()) :: String.t()
  def hex(string, opts \\ []) do
    string
    |> rgb(opts)
    |> Utils.rgb_to_hex()
  end

  @spec get_option(Keyword.t(), atom()) :: list()
  defp get_option(options, key) do
    case Keyword.get(options, key, @defaults) do
      value when is_integer(value) -> List.wrap(value)
      value = %Range{} -> Enum.to_list(value)
      value when is_list(value) -> value
    end
  end
end
