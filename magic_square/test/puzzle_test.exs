defmodule MagicSquare.PuzzleTest do
  use ExUnit.Case
  import MagicSquare.Puzzle

  test "all the rows, columns, and diagonal add to the same number" do
    square   = magic_square values()
    sum_rows = sum_rows(square)      |> Enum.into(MapSet.new)
    sum_cols = sum_cols(square)      |> Enum.into(MapSet.new)
    sum_diag = sum_diagonals(square) |> Enum.into(MapSet.new)

    Enum.each [sum_rows, sum_cols, sum_diag], &(assert 1 == MapSet.size(&1))
    assert MapSet.equal? sum_rows, sum_cols
    assert MapSet.equal? sum_rows, sum_diag
  end
end
