class Card
   
    VALUE = %i[2 3 4 5 6 7 8 9 10 11 12 13 14]
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
    attr_accessor :suit
    attr_accessor :value
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

    def deal_hand()
        @card_hand = Hand.new
        5.times do
            card_hand << @shuffled.pop()
        end
        return card_hand
        puts card_hand
    end
    attr_reader :card_hand
    attr_reader :shuffled
    attr_reader :deck
    attr_reader :hand
end

class Hand < Deck#returns array with all valued info
    include Comparable
    def initialize()
        @cards = []
    end

    def to_s
        @cards.each do |v|
            puts v
        end
    end

    def <<(other_card)
        @cards << other_card
    end

    def <=>(other)
        counter = 0
        self.each do |v|
            other.each do |x|
                v[counter] <=> x[counter]
                counter += 1
            end
        end
    end

    def prepare_cards()
        @value_arr = []
        @suit_arr = []
        @cards.each do |v|
            suit_arr << v.suit.to_s
            value_arr << v.value.to_s.to_i
        end
    end

    def array_increments(array) #checks to see if values are incrementing (example = 1,2,3,4,5)
        array.sort.each_cons(2).all? {|x,y| y == x + 1}
    end

    def matcher(num)
        temp_arr = []
        @cards.each do |v|
            temp_arr << v.value.to_s
        end
        temp_arr.each do |v|
            if temp_arr.count(v) == num
                return true
            end
        end
        false
    end

    def pair()
        matcher(2) == true ? 1 : 0
    end

    def three_of_a_kind() 
        matcher(3) == true ? 1 : 0
    end

    def four_of_a_kind()
        matcher(4) == true ? 1 : 0
    end

    def two_pair()
        prepare_cards()
        y = []; is = true; wrong = false
        value_arr.each do |v|
            value_arr.count(v) == 2 ?  y << v : false
        end
        z = value_arr.select { |k| y[0] != k} 
        z.each do |v|
            z.count(v) == 2 ? y << is : y << wrong 
        end
        return y.include?(true) == true ? 1 : 0
    end

    def full_house()
        matcher(2) == 1 && matcher(3) == 1 ? 1 : 0
    end

    def flush()
        prepare_cards()
        suit_arr.uniq.count == 1 ? 1 : 0
    end

    def straight()
        prepare_cards()
        array_increments(value_arr) == true ? 1 : 0
    end

    def straight_flush()
        straight() && flush() == 1 ? 1 : 0
    end

    def high_hand(hand)
        prepare_cards()
    end

    def score()
        prepare_cards()
        [ straight_flush(), four_of_a_kind(), full_house(), flush(), straight(), three_of_a_kind(), two_pair(), pair()].join
    end

    def play_game()
        return  black.score() <=> white.score() 
    #   puts "high card winner = #{black.value_arr.sort.reverse <=> white.value_arr.sort.reverse}"
    end

    def output()
        x = Deck.new
        @black = x.deal_hand()
        @white = x.deal_hand()

        thing = {1 => "Black wins", 0 => "Tie Game", -1 => "White wins"}

        black.to_s
        puts black.score()
        puts "================"
        white.to_s
        puts white.score()

        
        thing.each do |key, value|
            if play_game() == key 
                puts value
            end
       end
    end
    attr_reader :suit
    attr_reader :shuffled
    attr_reader :black
    attr_reader :white
    attr_reader :value_arr
    attr_reader :suit_arr
end
m = Hand.new
m.output()
# , high_hand(value_arr)