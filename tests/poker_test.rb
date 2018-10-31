require "minitest/autorun"
require_relative "../poker.rb"

class Poker < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_that_card_is_class
        x = Card.new("4","H")
        assert_equal(Card, x.class)
        assert_equal("4", x.card_value)
        assert_equal("4H", x.card_name)
        assert_equal("Hearts", x.card_shape)
    end

    def test_that_ten_card_registers
        x = Card.new("T", "S")
        assert_equal("10", x.card_value)
        assert_equal("Spades", x.card_shape)
    end

    def test_that_jack_card_registers
        x = Card.new("J", "C")
        assert_equal("11", x.card_value)
        assert_equal("Clubs", x.card_shape)
    end

    def test_that_queen_card_registers
        x = Card.new("Q", "D")
        assert_equal("12", x.card_value)
        assert_equal("Diamonds", x.card_shape)
    end

    def test_that_king_card_registers
        x = Card.new("K", "H")
        assert_equal("13", x.card_value)
    end

    def test_that_ace_card_registers
        x = Card.new("A", "H")
        assert_equal("14", x.card_value)
    end

    def test_that_hand_is_class
        x = Hand.new
        assert_equal(Hand, x.class)
    end

    def test_that_hand_is_array
        y = Hand.new
         assert_equal(Array, y.hand.class)
    end

    def test_that_hands_are_for_holdin
        x = Hand.new
        y = Card.new("2", "H")
        x.deal(y)
        assert_equal(Card, x.hand[0].class)
    end

    def test_that_stuff_is_in_deck
        d = Deck.new
        assert_equal(Card, d.deck[0].class)
        assert_equal("2H", d.deck[0].card_name)
        assert_equal("3H", d.deck[1].card_name)
        assert_equal("Clubs", d.deck[26].card_shape)
        assert_equal("10", d.deck[8].card_value)
        assert_equal(52, d.deck.length)
    end

    def test_that_deck_shuffles
        d = Deck.new
        f = d.shuffle_deck()
        refute_equal(f, d)
    end

    def test_that_deck_deals_hand
        z = Deck.new 
        z.shuffle_deck()
        n = z.deal_hand()
        assert_equal(5, n.hand.length)
    end

    def test_that_arrays_incriment
        x = Rules.new
        assert_equal(true, x.array_increments(1, [2, 3, 4]))
        assert_equal(false, x.array_increments(1, [2, 2, 2, 2]))
        assert_equal(true, x.array_increments(1, [5, 6, 7, 8, 9, 10]))
    end

    def test_straight_flush_is
        temp = Hand.new
        temp.deal(Card.new("2", "C"))
        temp.deal(Card.new("3", "C"))
        temp.deal(Card.new("4", "C"))
        temp.deal(Card.new("5", "C"))
        temp.deal(Card.new("6", "C"))
        game = Rules.new
        assert_equal(true, game.straight_flush(temp))
        assert_equal(8, game.ranking(temp))
    end

    def test_straight_flush_isnt
        temp = Hand.new
        temp.deal(Card.new("3", "H"))
        temp.deal(Card.new("3", "D"))
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("5", "S"))
        temp.deal(Card.new("9", "H"))
        game = Rules.new
        assert_equal(false, game.straight_flush(temp))
    end

    def test_4_of_a_kind_is
        temp = Hand.new
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("2", "S"))
        temp.deal(Card.new("2", "C"))
        temp.deal(Card.new("2", "D"))
        temp.deal(Card.new("4", "H"))
        game = Rules.new
        assert_equal(true, game.four_of_a_kind(temp))
        assert_equal(7, game.ranking(temp))
    end

    def test_4_of_a_kind_isnt
        temp = Hand.new
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("3", "S"))
        temp.deal(Card.new("8", "C"))
        temp.deal(Card.new("2", "D"))
        temp.deal(Card.new("4", "H"))
        game = Rules.new
        assert_equal(false, game.four_of_a_kind(temp))
    end

    def test_full_house_is
        temp = Hand.new
        temp.deal(Card.new("3", "H"))
        temp.deal(Card.new("3", "S"))
        temp.deal(Card.new("3", "C"))
        temp.deal(Card.new("2", "D"))
        temp.deal(Card.new("2", "H"))
        game = Rules.new
        assert_equal(true, game.full_house(temp))
        assert_equal(6, game.ranking(temp))
    end

    def test_full_house_isnt
        temp = Hand.new
        temp.deal(Card.new("4", "H"))
        temp.deal(Card.new("3", "S"))
        temp.deal(Card.new("3", "C"))
        temp.deal(Card.new("2", "D"))
        temp.deal(Card.new("2", "H"))
        game = Rules.new
        assert_equal(false, game.full_house(temp))
    end

    def test_flush_is
        temp = Hand.new
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("5", "H"))
        temp.deal(Card.new("J", "H"))
        temp.deal(Card.new("Q", "H"))
        temp.deal(Card.new("8", "H"))
        game = Rules.new
        assert_equal(true, game.flush(temp))
        assert_equal(5, game.ranking(temp))
    end

    def test_flush_isnt
        temp = Hand.new
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("5", "C"))
        temp.deal(Card.new("J", "S"))
        temp.deal(Card.new("Q", "H"))
        temp.deal(Card.new("8", "H"))
        game = Rules.new
        assert_equal(false, game.flush(temp))
    end

    def test_straight_is
        temp = Hand.new
        temp.deal(Card.new("3", "H"))
        temp.deal(Card.new("4", "H"))
        temp.deal(Card.new("5", "D"))
        temp.deal(Card.new("6", "C"))
        temp.deal(Card.new("7", "S"))
        game = Rules.new
        assert_equal(true, game.straight(temp))
        assert_equal(4, game.ranking(temp))
    end

    def test_straight_isnt
        temp = Hand.new
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("4", "D"))
        temp.deal(Card.new("9", "D"))
        temp.deal(Card.new("6", "C"))
        temp.deal(Card.new("7", "S"))
        game = Rules.new
        assert_equal(false, game.straight(temp))
    end

    def test_3_of_a_kind_is
        temp = Hand.new
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("A", "C"))
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("7", "H"))
        temp.deal(Card.new("2", "D"))
        game = Rules.new
        assert_equal(true, game.three_of_a_kind(temp))
        assert_equal(3, game.ranking(temp))
    end

    def test_3_of_a_kind_isnt
        temp = Hand.new
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("3", "C"))
        temp.deal(Card.new("8", "H"))
        temp.deal(Card.new("8", "H"))
        temp.deal(Card.new("2", "D"))
        game = Rules.new
        assert_equal(false, game.three_of_a_kind(temp))
    end    

    def test_2_pair_is
        temp = Hand.new
        temp.deal(Card.new("5", "H"))
        temp.deal(Card.new("2", "D"))
        temp.deal(Card.new("2", "H"))
        temp.deal(Card.new("7", "C"))
        temp.deal(Card.new("7", "S"))
        game = Rules.new
        assert_equal(true, game.two_pair(temp))
        assert_equal(2, game.ranking(temp))
    end

    def test_2_pair_is_2
        temp = Hand.new
        temp.deal(Card.new("8", "H"))
        temp.deal(Card.new("2", "C"))
        temp.deal(Card.new("8", "C"))
        temp.deal(Card.new("2", "S"))
        temp.deal(Card.new("7", "S"))
        game = Rules.new
        assert_equal(true, game.two_pair(temp))
    end

    def test_2_pair_is_3
        temp = Hand.new
        temp.deal(Card.new("6", "H"))
        temp.deal(Card.new("6", "C"))
        temp.deal(Card.new("4", "C"))
        temp.deal(Card.new("4", "S"))
        temp.deal(Card.new("3", "S"))
        game = Rules.new
        assert_equal(true, game.two_pair(temp))
    end

    def test_2_pair_isnt
        temp = Hand.new
        temp.deal(Card.new("6", "H"))
        temp.deal(Card.new("3", "C"))
        temp.deal(Card.new("4", "C"))
        temp.deal(Card.new("2", "S"))
        temp.deal(Card.new("4", "S"))
        game = Rules.new
        assert_equal(false, game.two_pair(temp))
    end

    def test_2_pair_isnt_2
        temp = Hand.new
        temp.deal(Card.new("4", "H"))
        temp.deal(Card.new("3", "C"))
        temp.deal(Card.new("4", "C"))
        temp.deal(Card.new("2", "S"))
        temp.deal(Card.new("4", "S"))
        game = Rules.new
        assert_equal(false, game.two_pair(temp))
    end
    
    def test_pair_is
        temp = Hand.new
        temp.deal(Card.new("4", "H"))
        temp.deal(Card.new("3", "C"))
        temp.deal(Card.new("4", "D"))
        temp.deal(Card.new("2", "S"))
        temp.deal(Card.new("8", "S"))
        game = Rules.new
        assert_equal(true, game.pair(temp))
        assert_equal(1, game.ranking(temp))
    end

    def test_pair_isnt
        temp = Hand.new
        temp.deal(Card.new("6", "H"))
        temp.deal(Card.new("2", "C"))
        temp.deal(Card.new("3", "D"))
        temp.deal(Card.new("4", "S"))
        temp.deal(Card.new("5", "S"))
        game = Rules.new
        assert_equal(false, game.pair(temp))
    end

    def test_high_card
        temp = Hand.new
        temp.deal(Card.new("6", "H"))
        temp.deal(Card.new("2", "C"))
        temp.deal(Card.new("3", "D"))
        temp.deal(Card.new("4", "S"))
        temp.deal(Card.new("5", "S"))
        game = Rules.new
        assert_equal(6, game.high_card(temp))
        assert_equal(0, game.ranking(temp))
    end

    def test_high_card
        temp = Hand.new
        temp.deal(Card.new("9", "H"))
        temp.deal(Card.new("8", "D"))
        temp.deal(Card.new("2", "D"))
        temp.deal(Card.new("5", "H"))
        temp.deal(Card.new("8", "D"))
        game = Rules.new
        assert_equal(9, game.high_card(temp))
    end

    def test_ranking_straight_flush
        temp = Hand.new
        temp.deal(Card.new("2", "C"))
        temp.deal(Card.new("3", "C"))
        temp.deal(Card.new("4", "C"))
        temp.deal(Card.new("5", "C"))
        temp.deal(Card.new("6", "C"))
        game = Rules.new
        assert_equal(8, game.ranking(temp))
    end

end