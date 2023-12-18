defmodule BurritoExampleTest do
  use ExUnit.Case
  doctest BurritoExample

  test "greets the world" do
    assert BurritoExample.hello() == :world
  end
end
