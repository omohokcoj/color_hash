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
end
