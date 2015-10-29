defmodule MagicSquare.PuzzleTest do
  use ExUnit.Case
  import MagicSquare.Puzzle

  test "all the rows, columns, and diagonal add to the same number" do
    square   = magic_square values
    sum_rows = sum_rows(square)      |> Enum.into(HashSet.new)
    sum_cols = sum_cols(square)      |> Enum.into(HashSet.new)
    sum_diag = sum_diagonals(square) |> Enum.into(HashSet.new)

    Enum.each [sum_rows, sum_cols, sum_diag], &(assert 1 = Set.size(&1))
    assert Set.equal? sum_rows, sum_cols
    assert Set.equal? sum_rows, sum_diag
  end
end
