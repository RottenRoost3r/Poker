class Card
    VALUE = %i[1 2 3 4 5 6 7 8 9 10 11 12 13 14]
    SUITS = %i[Hearts Clubs Diamonds Spades]
    
    Card = Struct.new(:value, :suit) do 
        def to_s #redefine to_s to return card names as string
            "#{value} of #{suit}"
        end

        def ==(other) #redefine == to check for value instead of id
            self.value == other.value &&
            self.suit == other.suit
        end
    end
end

class Deck < Card #establishes deck and cards, deals hands
    def initialize() #creates and shuffles deck
        @hand = []
        @deck = VALUE.flat_map {|val| SUITS.map {|suit| Card.new(val, suit)}}   
        @shuffled = @deck.shuffle
    end

    def deal(card_array) #deals a hand of five random cards
        @hand = Hand.new
        # 5.times do
        #     hand << @shuffled.pop().to_s
        # end
        card_array.each do |v|
            @hand << Card.new(v[0], v[1])
        end
        return hand
    end
   
    attr_reader :shuffled
    attr_reader :deck
    attr_reader :hand
end

class Hand  #returns array with all valued info
    def initialize()
        @cards = []
    end
    def <<(other_card)
        @cards << other_card
    end

    def matcher(num)
    end

end

class ChickenDinner #finds winner
    include Comparable
end