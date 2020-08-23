require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'
require './lib/deck'

class CardGeneratorTest < MiniTest::Test

  def test_it_exists
    filename = "./data/cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_it_has_filename_attribute
    filename = "./data/cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal filename, cards.filename
  end

  def test_reads_first_line
    filename = "./data/cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal "2, Heart, 2", cards.read_lines[0]
  end

  def test_card_is_created
    filename = "./data/cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of Card, cards.cards[0]
    assert_equal 52, cards.cards.length
  end

end
