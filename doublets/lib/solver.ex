defmodule Doublets.Solver do

  def words do
    "./resources/words.txt"
      |> File.stream!
      |> Enum.map(fn(s) -> String.strip(s) end)
      |> Enum.map(&to_char_list/1)
      |> Enum.to_list
  end

  def doublets(word1, word2) when is_binary(word1) and is_binary(word2) do
    cond do
      String.length(word1) == String.length(word2) ->
        doublets to_char_list(word1), to_char_list(word2)
      true ->  
        []
    end  
  end

  def doublets(word1, word2) when is_list(word1) and is_list(word2) do
    dict = words |> Enum.filter(fn(w) -> length(w) == length(word1) end)
                 |> List.delete word1
    _doublets(word2, [word1], dict)
      |> Enum.map &(to_string/1)
  end

  def _doublets(_word2, _seq, []), do: []

  def _doublets(word2, seq, dict) do
    last = hd seq
    if last == word2 do
      Enum.reverse seq 
    else
      case doublets = find_doublets(last, dict) do
        []    -> []
        [_|_] ->
          doublets 
            |> Enum.flat_map fn(d) -> 
                 new_dict = List.delete dict, d
                 _doublets word2, [d|seq], new_dict 
               end
      end
    end
  end

  def find_doublets(w, dict) do
    Enum.filter dict, fn(dw) -> count_differences(w, dw) == 1 end
  end

  def count_differences(w1, w2) do
     Enum.zip(w1, w2)
       |> Enum.reduce 0, fn({a,b}, acc) -> if a != b, do: acc + 1, else: acc end
  end
end
