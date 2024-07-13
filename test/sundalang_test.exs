defmodule SundalangTest do
  use ExUnit.Case
  doctest Sundalang

  test "greets the world" do
    assert Sundalang.hello() == :world
  end
end
