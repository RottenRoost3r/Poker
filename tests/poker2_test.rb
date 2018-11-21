require "minitest/autorun"
require_relative "../poker2.rb"

class Poker2 < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_that_matcher_matches
        temp = Deck.new
        temp_arr = []
        temp_arr << ["2", "Hearts"]
        temp_arr << ["9", "Clubs"]
        temp_arr << ["4", "Hearts" ]
        temp_arr << ["3", "Spades"]
        temp_arr << ["9", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(true, temp.hand.matcher(2))
    end

    def test_that_pair_works
        temp = Deck.new
        temp_arr = []
        temp_arr << ["2", "Hearts"]
        temp_arr << ["3", "Clubs"]
        temp_arr << ["4", "Hearts" ]
        temp_arr << ["3", "Spades"]
        temp_arr << ["9", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(true, temp.hand.pair())
    end

    def test_that_pair_works_2
        temp = Deck.new
        temp_arr = []
        temp_arr << ["14", "Hearts"]
        temp_arr << ["4", "Hearts"]
        temp_arr << ["4", "Hearts" ]
        temp_arr << ["3", "Spades"]
        temp_arr << ["9", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(true, temp.hand.pair())
    end

    def test_that_3_of_a_kind_works
        temp = Deck.new
        temp_arr = []
        temp_arr << ["2", "Hearts"]
        temp_arr << ["4", "Spades"]
        temp_arr << ["4", "Hearts" ]
        temp_arr << ["3", "Spades"]
        temp_arr << ["4", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(true, temp.hand.three_of_a_kind())
    end

    def test_that_3_of_a_kind_works
        temp = Deck.new
        temp_arr = []
        temp_arr << ["2", "Spades"]
        temp_arr << ["5", "Hearts"]
        temp_arr << ["5", "Diamonds" ]
        temp_arr << ["5", "Spades"]
        temp_arr << ["4", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(true, temp.hand.three_of_a_kind())
    end

    def test_that_4_of_a_kind_works
        temp = Deck.new
        temp_arr = []
        temp_arr << ["5", "Spades"]
        temp_arr << ["5", "Hearts"]
        temp_arr << ["5", "Diamonds" ]
        temp_arr << ["5", "Clubs"]
        temp_arr << ["4", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(true, temp.hand.four_of_a_kind())
    end
    

end