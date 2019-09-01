defmodule ColorHashTest do
  use ExUnit.Case
  doctest ColorHash

  test "hsl" do
    assert ColorHash.hsl("John Doe") == [242, 0.35, 0.35]
  end

  test "rgb" do
    assert ColorHash.rgb("Joana Doeian") == [83, 172, 138]
  end

  test "hex" do
    assert ColorHash.hex("Julien Deamond") == "#c58795"
  end

  test "lightness" do
    assert ColorHash.hex("test", lightness: 0.1) == "#26140d"
  end

  test "saturation" do
    assert ColorHash.hex("test", saturation: 0.1) == "#8c7a73"
  end

  test "lightness and saturation" do
    assert ColorHash.hex("test", saturation: 0.1, lightness: 0.1) == "#1c1817"
  end
end
