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
        5.times do
            self[counter] <=> other[counter]
            counter += 1
        end

        # counter = 0
        # self.each do |v|
        #     other.each do |x|
        #         v[counter] <=> x[counter]
        #         counter += 1
        #     end
        # end
    end

    def prepare_cards()
        @value_arr = []
        @suit_arr = []
        @cards.each do |v|
            suit_arr << v.suit.to_s
            value_arr << v.value.to_s.to_i
        end
        value_arr.sort!.reverse
    end

    def array_increments(array) #checks to see if values are incrementing (example = 1,2,3,4,5)
        array.sort.each_cons(2).all? {|x,y| y == x + 1}
    end

    def matcher(num)
        temp_arr = []
        @cards.each do |v|
            temp_arr << v.value.to_s
        end
        temp_arr.each_with_index do |v, i|
            if temp_arr.count(v) == num
                return true
            end
        end
        false
    end

    def matcher2(num)
        prepare_cards()
        new_arr = []
       value_arr.sort!.reverse!
        value_arr.each do |v|
            if value_arr.count(v) == num
                new_arr << v 
            end
        end
        temp = value_arr - new_arr
        temp.sort!
        x = temp.length
        x.times do |v|
            new_arr << temp.pop()
        end
        return new_arr
    end

    def pair()
        matcher(2) == true ? 1 : 0
    end

    def pair2()
        matcher2(2) 
    end

    def three_of_a_kind() 
        matcher(3) == true ? 1 : 0
    end
    
    def three_of_a_kind2()
        matcher2(3)
    end

    def four_of_a_kind()
        matcher(4) == true ? 1 : 0
    end

    def four_of_a_kind2()
        matcher2(4)
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

    def two_pair2()
        matcher2(2)
    end

    def full_house()
        matcher(2) && matcher(3) ? 1 : 0
    end

    def full_house2()
        matcher2(3)
    end

    def flush()
        prepare_cards()
        suit_arr.uniq.count == 1 ? 1 : 0
    end

    def flush2()
        matcher2(1)
    end

    def straight()
        prepare_cards()
        array_increments(value_arr) == true ? 1 : 0
    end

    def straight2()
        matcher2(1)
    end

    def straight_flush()
        straight() && flush() == 1 ? 1 : 0
    end

    def straight_flush2()
        matcher2(1)
    end

    def high_hand()
        x = score()
        y = 0
        x.each_char do |v|
            if v == "1"
                break
            else
                y += 1
            end
        end
        #p x
        #p y
        vir = [straight_flush2(), four_of_a_kind2(), full_house2(), flush2(), straight2(), three_of_a_kind2(), two_pair2(), pair2(), straight2()]
        return vir[y]
    end

    def high_compare()
        @black.high_hand().each_with_index do |v, i|
            if v > @white.high_hand()[i]
                return 1
            elsif v < @white.high_hand()[i]
                return -1
            end
        end
        return 0
    end

    def score()
        prepare_cards()
        [straight_flush(), four_of_a_kind(), full_house(), flush(), straight(), three_of_a_kind(), two_pair(), pair()].join
    end

    def play_game()
        
        return  black.score() <=> white.score() 
       #puts "high card winner = #{black.value_arr.sort.reverse <=> white.value_arr.sort.reverse}"
    end

    def output()
        x = Deck.new
        @black = x.deal_hand()
        @white = x.deal_hand()
        hand_types = {0 => "High Card", 1 => "Pair", 11 => "Two Pair", 100 => "Three of a Kind", 1000 => "Straight", 10000 => "Flush", 100101 => "Full House", 1000000 => "Four of a Kind", 10000000 => "Straight Flush"}

        winners = {1 => "Black wins", -1 => "White wins"}

        x = ""
        hand_types.each do |key, value|
            if @black.score().to_i == key     
                x = value
            end
        end
        if winners.has_key?(play_game())
            puts "#{winners[play_game()]}, #{x}"
        elsif winners.has_key?(high_compare())
            puts "#{winners[high_compare()]}, #{x}"
        else
            puts "it's a tie"
        end
        
        p black.high_hand()
        black.to_s
        # puts black.score()
        puts "================"
        white.to_s
        #puts white.score()
        
        # puts black.value_arr.sort.reverse <=> white.value_arr.sort.reverse
        
        
    end
    attr_reader :cards
    attr_reader :temp_arr
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