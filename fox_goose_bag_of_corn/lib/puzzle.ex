defmodule FoxGooseBagOfCorn.Puzzle do

  @start_position [
    [[:fox, :goose, :corn, :you], [:boat], []]
  ]

  def river_crossing_plan do
     # Implement this with an algorithm.
     # Hard coding the solution is easy! ;-)
    [
      [[:fox, :goose], [:boat, :you, :corn, :goose], [:you]],
      [[:goose, :corn], [:boat], [:you]]
    ] 
  end

  def to_set(list) when is_list(list), do: Enum.into(list, MapSet.new)
  def step_to_sets(step), do: step |> Enum.map(&to_set/1)

  @doc """
    Defines a sigil for a HashSet of atoms

    Example: 
    iex> import #{__MODULE__}
    iex> ~H":a :b :c"
    #MapSet<[:a, :b, :c]>
    iex> ~H""
    #MapSet<[]>
  """
  def sigil_H(str, _opts) do
    str |> String.split(" ") 
        |> Enum.filter(&String.length(&1) > 0)
        |> Enum.map(&String.replace(&1,":","")) 
        |> Enum.map(&String.to_atom/1)
        |> Enum.into(MapSet.new)
  end
end
