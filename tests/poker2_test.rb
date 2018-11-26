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
        assert_equal(1, temp.hand.matcher(2))
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
        assert_equal(1, temp.hand.pair())
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
        assert_equal(1, temp.hand.pair())
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
        assert_equal(1, temp.hand.three_of_a_kind())
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
        assert_equal(1, temp.hand.three_of_a_kind())
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
        assert_equal(1, temp.hand.four_of_a_kind())
    end
    
    def test_that_4_of_a_kind_works
        temp = Deck.new
        temp_arr = []
        temp_arr << ["5", "Spades"]
        temp_arr << ["3", "Hearts"]
        temp_arr << ["3", "Spades" ]
        temp_arr << ["3", "Clubs"]
        temp_arr << ["3", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.four_of_a_kind())
    end

    def test_full_house
        temp = Deck.new
        temp_arr = []
        temp_arr << ["9", "Spades"]
        temp_arr << ["6", "Hearts"]
        temp_arr << ["6", "Spades" ]
        temp_arr << ["9", "Clubs"]
        temp_arr << ["9", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.full_house())
    end

    def test_two_pair_works
        temp = Deck.new
        temp_arr = []
        temp_arr << ["9", "Spades"]
        temp_arr << ["6", "Hearts"]
        temp_arr << ["6", "Spades" ]
        temp_arr << ["2", "Clubs"]
        temp_arr << ["9", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.two_pair())
    end

    def test_high_card_function
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Spades"]
        temp_arr << ["6", "Hearts"]
        temp_arr << ["2", "Spades" ]
        temp_arr << ["9", "Clubs"]
        temp_arr << ["8", "Diamonds"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(23689, temp.hand.high_hand(temp_arr))
    end

    def test_flush
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Spades"]
        temp_arr << ["6", "Spades"]
        temp_arr << ["2", "Spades" ]
        temp_arr << ["9", "Spades"]
        temp_arr << ["8", "Spades"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.flush())
    end

    def test_straight
        temp = Deck.new
        temp_arr = []
        temp_arr << ["3", "Diamonds"]
        temp_arr << ["4", "Spades"]
        temp_arr << ["5", "Clubs" ]
        temp_arr << ["6", "Spades"]
        temp_arr << ["7", "Hearts"]
        temp.deal(temp_arr)
        game = Hand.new
        assert_equal(1, temp.hand.straight())
    end
end