defmodule FoxGooseBagOfCorn.Puzzle do

  @start_position [
    [[:fox, :goose, :corn, :you], [:boat], []]
  ]

  def river_crossing_plan do
    [
      [[:fox, :goose, :corn ,:you], [:boat]              , []],
      [[:fox, :corn]              , [:boat, :goose, :you], []],
      [[:fox, :corn]              , [:boat]              , [:goose, :you]],
      [[:fox, :corn]              , [:boat, :you]        , [:goose]],
      [[:fox, :corn, :you]        , [:boat]              , [:goose]],
      [[:fox]                     , [:boat, :corn, :you] , [:goose]],
      [[:fox]                     , [:boat]              , [:goose, :corn, :you]],
      [[:fox]                     , [:boat, :goose, :you], [:corn]],
      [[:fox, :goose, :you]       , [:boat]              , [:corn]],
      [[:goose]                   , [:boat, :fox, :you]  , [:corn]],
      [[:goose]                   , [:boat]              , [:corn, :fox, :you]],
      [[:goose]                   , [:boat, :you]        , [:corn, :fox]],
      [[:goose, :you]             , [:boat]              , [:corn, :fox]],
      [[]                         , [:boat, :goose, :you], [:corn, :fox]],
      [[]                         , [:boat]              , [:fox, :goose, :corn, :you]]
    ]
  end

  def to_set(list) when is_list(list), do: Enum.into(list, HashSet.new)
  def step_to_sets(step), do: step |> Enum.map &to_set/1

  @doc """
    Defines a sigil for a HashSet of atoms

    Example: 
    iex> import #{__MODULE__}
    iex> ~H":a :b :c"
    #HashSet<[:c, :b, :a]>
    iex> ~H""
    #HashSet<[]>
  """
  def sigil_H(str, _opts) do
    str |> String.split(" ") 
        |> Enum.filter(&String.length(&1) > 0)
        |> Enum.map(&String.replace(&1,":","")) 
        |> Enum.map(&String.to_atom/1)
        |> Enum.into(HashSet.new)
  end
end
