class Card
    def initialize(number, suit)
        @card_name = "#{number}#{suit}"
        @card_value = "#{number}"
        @card_shape = "#{suit}"
        case number
        when "T"
            @card_value = "10"
        when "J"
            @card_value = "11"
        when "Q"
            @card_value = "12"
        when "K"
            @card_value = "13"
        when "A"
            @card_value = "14"
        end

        case suit
        when "H"
            @card_shape = "Hearts"
        when "S"
            @card_shape = "Spades"
        when "C"
            @card_shape = "Clubs"
        when "D"
            @card_shape = "Diamonds"
        end
    end
    attr_reader :card_value
    attr_reader :card_name
    attr_reader :card_shape
end

class Hand
    def initialize()
        @hand = []
    end

    def deal(card)
        @hand << card
    end
    attr_reader :hand
end

class Deck
    def initialize()
        @deck = []
        card_value = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
        card_shape = ['H', 'S', 'C', 'D']
        card_shape.each do |shape|
            card_value.each do |val|
                @deck << Card.new(val, shape)
            end
            @deck
        end
    end

    def shuffle_deck()
        @deck.shuffle!
    end

    def deal_hand()
        y = Hand.new
        5.times do
            y.deal(@deck.pop())
        end
        return y
    end

    attr_reader :deck
end