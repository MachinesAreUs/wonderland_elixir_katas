defmodule MagicSquare.Puzzle do

  def values, do: [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]

  def magic_square(values) do
    permutations(values)
      |> Enum.map(&to_matrix/1)
      |> Enum.filter(&is_solution?/1)
      |> hd
  end

  def permutations(vals) do
    initial_sols = Enum.map values, fn(x) -> [x] end
    _permutations(initial_sols, vals)
  end

  def _permutations(sols, vals) when length(hd sols) == length(vals), do: sols

  def _permutations(sols, vals) do
    for(sol <- sols, do: (vals -- sol) |> Enum.map &(sol ++ [&1]))
      |> Enum.concat
      |> _permutations(vals)
  end

  def to_matrix(list) do
    size = :math.sqrt(length(list)) |> round
    for r <- 0..(size-1) do
      list |> Enum.drop(size*r) |> Enum.take(size) 
    end
  end

  def is_solution?(p) do
    sum_r = sum_rows(p)      |> Enum.into(HashSet.new)
    sum_c = sum_cols(p)      |> Enum.into(HashSet.new)
    sum_d = sum_diagonals(p) |> Enum.into(HashSet.new)

    Enum.all?([sum_r, sum_c, sum_d], &(Set.size(&1) == 1))
      && Set.equal?(sum_r, sum_c) 
      && Set.equal?(sum_c, sum_d) 
  end

  def sum_rows(m) do
    Enum.map m, fn(r) -> Enum.reduce(r, &(&1+&2)) end
  end

  def sum_cols(m) do
    for idx <- 0..(length(m) - 1) do
      m |> Enum.map(&Enum.at(&1, idx)) |> Enum.reduce(&(&1+&2))
    end
  end

  def at(m, {r,c}), do: m |> Enum.at(r) |> Enum.at(c)
  
  def sum_diagonals(m) do
    [at(m,{0,0}) + at(m,{1,1}) + at(m,{2,2}), 
     at(m,{2,0}) + at(m,{1,1}) + at(m,{0,2})] 
  end
end
