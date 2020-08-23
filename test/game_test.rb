require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


class StartTest < MiniTest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_52_cards_are_created_by_default
    game = Game.new

    assert_equal 52, game.create_deck_of_cards.length
  end

  def test_can_input_cards_from_file
    filename = "./data/cards.txt"
    game = Game.new(filename)

    assert_equal 26, game.player1.deck.cards.length
    assert_equal 26, game.player2.deck.cards.length
  end

  def test_2_piles_of_26_cards_are_created
    game = Game.new
    cards = game.create_deck_of_cards()
    both_decks = game.create_pile_of_cards_for_each_player(cards)

    assert_equal 26, both_decks[0].cards.length
    assert_equal 26, both_decks[1].cards.length
  end

  def test_2_players_have_26_cards_each
    game = Game.new
    cards = game.create_deck_of_cards()
    both_decks = game.create_pile_of_cards_for_each_player(cards)
    game.create_two_players(both_decks)

    assert_equal 26, game.player1.deck.cards.length
    assert_equal 26, game.player2.deck.cards.length
  end

  def test_player_turn_increases_turn_counter
    game = Game.new
    cards = game.create_deck_of_cards()
    game.create_pile_of_cards_for_each_player(cards)

    assert_equal 0, game.turn_counter
    game.player_turn
    assert_equal 1, game.turn_counter
    game.player_turn
    assert_equal 2, game.turn_counter
  end

  def test_player_turn_creates_new_turn
    game = Game.new
    cards = game.create_deck_of_cards()
    both_decks = game.create_pile_of_cards_for_each_player(cards)
    game.create_two_players(both_decks)
    turn = game.player_turn

    assert_instance_of Turn, turn
  end

  def test_game_ends_after_1_million_turns
    game = Game.new
    1000000.times do
      game.player_turn
    end
    game.start

    assert_equal 1000000, game.turn_counter
  end

end
