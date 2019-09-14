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
    assert ColorHash.hex("test", lightness: 10) == "#26140d"
  end

  test "saturation" do
    assert ColorHash.hex("test", saturation: 10) == "#8c7a73"
  end

  test "lightness and saturation" do
    assert ColorHash.hex("test", saturation: 10, lightness: 10) == "#1c1817"
  end

  test "range params" do
    assert ColorHash.hex("test", saturation: 10..10) == "#8c7a73"
    assert ColorHash.hex("test", saturation: 1..100) == "#c96236"
  end

  test "list params" do
    assert ColorHash.hex("test", saturation: [10]) == "#8c7a73"
  end
end
