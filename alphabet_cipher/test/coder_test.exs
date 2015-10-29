defmodule AlphabetCipher.CoderTest do
  use ExUnit.Case
  import AlphabetCipher.Coder

  test "Can encode given a secret keyword" do
    assert "egsgqwtahuiljgs" == 
           encode("scones", "meetmebythetree") 
    assert "hmkbxebpxpmyllyrxiiqtoltfgzzv" == 
           encode("vigilance", "meetmeontuesdayeveningatseven")
  end

  test "Can decode an cyrpted message given a secret keyword" do
    assert "meetmebythetree" == 
           decode("scones", "egsgqwtahuiljgs")
    assert "meetmeontuesdayeveningatseven" ==
           decode("vigilance", "hmkbxebpxpmyllyrxiiqtoltfgzzv")
  end

  test "Can extract the secret keyword given an encrypted message and the original message" do
    assert "scones" ==
           decipher("hcqxqqtqljmlzhwiivgbsapaiwcenmyu", "packmyboxwithfivedozenliquorjugs")
    assert "vigilance" == 
           decipher("opkyfipmfmwcvqoklyhxywgeecpvhelzg", "thequickbrownfoxjumpsoveralazydog")
  end

end
