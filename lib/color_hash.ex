defmodule ColorHash do
  @moduledoc ~S"""
  Generate color based on the given string.
  """

  alias ColorHash.{
    BKDR,
    Utils
  }

  @ls [0.35, 0.5, 0.65]

  @spec hsl(String.t()) :: list()
  def hsl(string) do
    hash = BKDR.hash(string)

    h = rem(hash, 359)
    s = Enum.at(@ls, rem(div(hash, 360), length(@ls)))
    l = Enum.at(@ls, rem(div(hash, 360 * length(@ls)), length(@ls)))

    [h, s, l]
  end

  @spec rgb(String.t()) :: list()
  def rgb(string) do
    string
    |> hsl()
    |> Utils.hsl_to_rgb()
  end

  @spec hex(String.t()) :: String.t()
  def hex(string) do
    string
    |> rgb()
    |> Utils.rgb_to_hex()
  end
end
