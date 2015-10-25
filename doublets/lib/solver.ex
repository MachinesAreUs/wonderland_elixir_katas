defmodule Doublets.Solver do

  def words do
    "./resources/words.txt"
      |> File.stream!
      |> Enum.to_list
  end

  def doublets(word1, word2) do
    "make me work"
  end

end
