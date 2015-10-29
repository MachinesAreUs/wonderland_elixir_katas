defmodule MagicSquare.Puzzle do

  def values, do: [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]

  def magic_square(values) do
     [[1.0, 1.5, 2.0],
      [2.5, 3.0, 3.5],
      [4.0, 4.5, 5.0]]
  end

  def sum_rows(m) do
    Enum.map m,  fn(r) -> Enum.reduce(r, &(&1+&2)) end
  end

  def sum_cols(m) do
    for idx <- 0..(length(m) - 1) do
      Enum.map(m, &Enum.at(&1, idx)) |> Enum.reduce(&(&1+&2))
    end
  end

  def at(m, {r,c}), do: Enum.at(Enum.at(m, r), c)
  
  def sum_diagonals(m) do
    [at(m,{0,0}) + at(m,{1,1}) + at(m,{2,2}), 
     at(m,{2,0}) + at(m,{1,1}) + at(m,{0,2})] 
  end

end
