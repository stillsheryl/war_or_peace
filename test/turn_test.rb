require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < MiniTest::Test

  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_players_have_a_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
  end

  def test_spoils_of_war_starts_as_empty
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war
  end

  def test_turn_has_a_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    card9 = Card.new(:spades, '8', 8)
    card10 = Card.new(:spades, '7', 7)
    card11 = Card.new(:heart, 'Queen', 12)
    card12 = Card.new(:diamond, 'Jack', 11)
    card13 = Card.new(:spades, '8', 8)
    card14 = Card.new(:diamond, 'Queen', 12)
    card15 = Card.new(:spades, 'Ace', 14)
    card16 = Card.new(:diamond, '5', 5)
    deck3 = Deck.new([card9, card10, card11, card12])
    deck4 = Deck.new([card13, card14, card15, card16])
    player3 = Player.new("Sally", deck3)
    player4 = Player.new("Paul", deck4)
    turn2 = Turn.new(player3, player4)
    deck5 = Deck.new([card9, card10, card4, card12])
    deck6 = Deck.new([card13, card14, card12, card4])
    player5 = Player.new("Sally", deck5)
    player6 = Player.new("Paul", deck6)
    turn3 = Turn.new(player5, player6)

    assert_equal :basic, turn.type
    assert_equal :war, turn2.type
    assert_equal :mutually_assured_destruction, turn3.type
  end

  def test_turn_has_a_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    card9 = Card.new(:spades, '8', 8)
    card10 = Card.new(:spades, '7', 7)
    card11 = Card.new(:heart, 'Queen', 12)
    card12 = Card.new(:diamond, 'Jack', 11)
    card13 = Card.new(:spades, '8', 8)
    card14 = Card.new(:diamond, 'Queen', 12)
    card15 = Card.new(:spades, 'Ace', 14)
    card16 = Card.new(:diamond, '5', 5)
    deck3 = Deck.new([card9, card10, card11, card12])
    deck4 = Deck.new([card13, card14, card15, card16])
    player3 = Player.new("Sally", deck3)
    player4 = Player.new("Paul", deck4)
    turn2 = Turn.new(player3, player4)
    deck5 = Deck.new([card9, card10, card4, card12])
    deck6 = Deck.new([card13, card14, card12, card4])
    player5 = Player.new("Sally", deck5)
    player6 = Player.new("Paul", deck6)
    turn3 = Turn.new(player5, player6)

    assert_equal player1, turn.winner
    assert_equal player4, turn2.winner
    assert_equal "No Winner", turn3.winner
  end

  def test_pile_cards_collects_cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    card9 = Card.new(:spades, '8', 8)
    card10 = Card.new(:spades, '7', 7)
    card11 = Card.new(:heart, 'Queen', 12)
    card12 = Card.new(:diamond, 'Jack', 11)
    card13 = Card.new(:spades, '8', 8)
    card14 = Card.new(:diamond, 'Queen', 12)
    card15 = Card.new(:spades, 'Ace', 14)
    card16 = Card.new(:diamond, '5', 5)
    deck3 = Deck.new([card9, card10, card11, card12])
    deck4 = Deck.new([card13, card14, card15, card16])
    player3 = Player.new("Sally", deck3)
    player4 = Player.new("Paul", deck4)
    turn2 = Turn.new(player3, player4)
    deck5 = Deck.new([card9, card10, card4, card12])
    deck6 = Deck.new([card13, card14, card12, card4])
    player5 = Player.new("Sally", deck5)
    player6 = Player.new("Paul", deck6)
    turn3 = Turn.new(player5, player6)

    turn.pile_cards
    assert_equal [card1, card3], turn.spoils_of_war
    assert_equal [card2, card5, card8], player1.deck.cards
    assert_equal [card4, card6, card7], player2.deck.cards

    turn2.pile_cards
    assert_equal [card9, card10, card11, card13, card14, card15], turn2.spoils_of_war
    assert_equal [card12], player3.deck.cards
    assert_equal [card16], player4.deck.cards

    turn3.pile_cards
    assert_equal [], turn3.spoils_of_war
    assert_equal [card12], player5.deck.cards
    assert_equal [card4], player6.deck.cards
  end

  def test_awards_spoils_gives_spoil_cards_to_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    card9 = Card.new(:spades, '8', 8)
    card10 = Card.new(:spades, '7', 7)
    card11 = Card.new(:heart, 'Queen', 12)
    card12 = Card.new(:diamond, 'Jack', 11)
    card13 = Card.new(:spades, '8', 8)
    card14 = Card.new(:diamond, 'Queen', 12)
    card15 = Card.new(:spades, 'Ace', 14)
    card16 = Card.new(:diamond, '5', 5)
    deck3 = Deck.new([card9, card10, card11, card12])
    deck4 = Deck.new([card13, card14, card15, card16])
    player3 = Player.new("Sally", deck3)
    player4 = Player.new("Paul", deck4)
    turn2 = Turn.new(player3, player4)
    deck5 = Deck.new([card9, card10, card4, card12])
    deck6 = Deck.new([card13, card14, card12, card4])
    player5 = Player.new("Sally", deck5)
    player6 = Player.new("Paul", deck6)
    turn3 = Turn.new(player5, player6)

    winner = turn.winner
    turn.pile_cards
    assert_equal [card1, card3], turn.spoils_of_war
    turn.award_spoils(winner)

    assert_equal deck1, player1.deck
    assert_equal deck2, player2.deck

    winner = turn2.winner
    turn2.pile_cards
    assert_equal [card9, card10, card11, card13, card14, card15], turn2.spoils_of_war
    turn.award_spoils(winner)

    assert_equal deck3, player3.deck
    assert_equal deck4, player4.deck

    winner = turn3.winner
    turn3.pile_cards
    assert_equal [], turn3.spoils_of_war

    assert_equal [card12], player5.deck.cards
    assert_equal [card4], player6.deck.cards
  end

end
