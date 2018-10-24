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
    end
        
end