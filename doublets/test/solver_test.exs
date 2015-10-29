defmodule Doublets.SolverTest do
  use ExUnit.Case
  import Doublets.Solver

  test "with word links found" do
    assert ["head", "heal", "teal", "tell", "tall", "tail"] ==
           doublets("head", "tail")

    assert ["door", "boor", "book", "look", "lock"] ==
           doublets("door", "lock")

    assert ["bank", "bonk", "book", "look", "loon", "loan"] ==
           doublets("bank", "loan")

    assert ["wheat", "cheat", "cheap", "cheep", "creep", "creed", "breed", "bread"] ==
           doublets("wheat", "bread")
  end

  test "with no word links found" do
    assert [] == doublets("ye", "freezer")
  end
end
