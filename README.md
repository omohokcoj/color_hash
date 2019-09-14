# ColorHash

Elixir implementation of https://github.com/zenozeng/color-hash

## Installation

```elixir
def deps do
  [
    {:color_hash, "~> 0.2.0"}
  ]
end
```

## Use

```elixir
ColorHash.hex("Hello World")
ColorHash.hex("Hello World", saturation: 50..60)
ColorHash.hsl("Hello World", lightness: [50, 55, 65])
ColorHash.rgb("Hello World", lightness: 60, saturation: 40..50)
```

## TODO

* [x] add `lightness`, `saturation` options
* [ ] add `hue` option
