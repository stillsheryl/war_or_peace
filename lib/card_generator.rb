require './lib/card'
require './lib/deck'

class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = create_card_deck
  end

  def read_lines
    IO.readlines(@filename, chomp: true)
  end

  def create_card_deck
    @cards = read_lines.map do |card_string|
      card_pieces = card_string.split(",")
      card_pieces = card_pieces.map do |piece|
        piece.strip
      end
      Card.new(card_pieces[1].downcase.to_sym, card_pieces[0],card_pieces[2].to_i)
    end
  end

end
