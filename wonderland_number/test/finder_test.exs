defmodule WonderlandNumber.FinderTest do
  use ExUnit.Case
  import WonderlandNumber.Finder

  def to_charset(n) do
    n |> Integer.to_string 
      |> to_char_list 
      |> Enum.map(&[&1]) 
      |> Enum.into(HashSet.new)
  end

  def has_all_the_same_digits?(n1, n2) do
    s1 = to_charset n1
    s2 = to_charset n2
    Set.equal? s1, s2
  end

  test "A wonderland number must have the following things true about it" do
    wondernum = wonderland_number
    assert 6 = wondernum |> Integer.to_string |> String.length
    assert has_all_the_same_digits? wondernum, (2 * wondernum)
    assert has_all_the_same_digits? wondernum, (3 * wondernum)
    assert has_all_the_same_digits? wondernum, (4 * wondernum)
    assert has_all_the_same_digits? wondernum, (5 * wondernum)
    assert has_all_the_same_digits? wondernum, (6 * wondernum)
  end
end
