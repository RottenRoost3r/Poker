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
    end

    def test_that_ten_card_registers
        x = Card.new("T", "S")
        assert_equal("10", x.card_value)
    end

    def test_that_jack_card_registers
        x = Card.new("J", "C")
        assert_equal("11", x.card_value)
    end

    def test_that_queen_card_registers
        x = Card.new("Q", "H")
        assert_equal("12", x.card_value)
    end

    def test_that_king_card_registers
        x = Card.new("K", "H")
        assert_equal("13", x.card_value)
    end
end