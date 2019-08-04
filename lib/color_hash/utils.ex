defmodule ColorHash.Utils do
  @moduledoc false

  @spec rgb_to_hex(list()) :: String.t()
  def rgb_to_hex(rgb) do
    hex =
      rgb
      |> Enum.map(fn color ->
        color
        |> Integer.to_string(16)
        |> String.pad_leading(2, "0")
      end)
      |> Enum.join()
      |> String.downcase()

    "#" <> hex
  end

  @spec hsl_to_rgb(list()) :: list()
  def hsl_to_rgb([h, s, l]) do
    h = h / 360
    q = if l < 0.5, do: l * (1 + s), else: l + s - l * s
    p = 2 * l - q

    colors = [h + 1 / 3, h, h - 1 / 3]

    Enum.map(colors, fn color ->
      color =
        cond do
          color < 0 -> color + 1
          color > 1 -> color - 1
          true -> color
        end

      color =
        cond do
          color < 1 / 6 -> p + (q - p) * 6 * color
          color < 0.5 -> q
          color < 2 / 3 -> p + (q - p) * 6 * (2 / 3 - color)
          true -> p
        end

      round(color * 255)
    end)
  end
end
