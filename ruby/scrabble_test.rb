require 'test/unit'
require "./scrabble"

class MyTest < Test::Unit::TestCase
  def setup
    @dict = Scrabble::Dictionary.new "dictionary.txt"
  end

  def test_freq_hash_sub
    hash = { foo: 5, bar: 3}.extend(Scrabble::FreqHash)
    assert_equal ({foo: 2}), (hash - {foo: 3, bar: 3, baz: 3})
    assert_equal ({ foo: 5, bar: 3}), hash
  end

  def test_possible_words
   assert_equal ["AD", "ADD", "DAD"], @dict.possible_words("ADD")
  end
end