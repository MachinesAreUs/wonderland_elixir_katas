defmodule TinyMaze.SolverTest do
  use ExUnit.Case
  import TinyMaze.Solver

  test "can find way to exit with 3x3 maze" do
    maze = [[:S, 0, 1],
            [ 1, 0, 1],
            [ 1, 0, :E]]
    sol  = [[:x, :x, 1],
            [ 1, :x, 1],
            [ 1, :x, :x]]
    assert sol == solve_maze maze
  end

  test "can find way to exit with 4x4 maze" do
    maze = [[:S, 0, 0, 1],
            [ 1, 1, 0, 0],
            [ 1, 0, 0, 1],
            [ 1, 1, 0, :E]]
    sol  = [[:x, :x, :x, 1],
            [ 1,  1, :x, 0],
            [ 1,  0, :x, 1],
            [ 1,  1, :x, :x]]
    assert sol == solve_maze maze
  end
end
