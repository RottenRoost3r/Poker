require "minitest/autorun"
require_relative "../poker.rb"

class Poker < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_that_card_is_class
        x = Card.new(4,"H")
        assert_equal(Card, x.class)
    end
end