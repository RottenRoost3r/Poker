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
        shuffle_deck()
        y = Hand.new
        5.times do
            y.deal(@deck.pop())
        end
        return y
    end

    attr_reader :deck
end

class Rules
    attr_reader :temp_num
    attr_reader :temp_suit
    attr_reader :counter
    attr_reader :val
    def initialize()
        @temp_suit = []
        @temp_num = []
    end

    def prepare_cards(hand) #splits the hand into 2 arrays, one for suit and the other for value
        @temp_suit = []
        @temp_num = []
        hand.hand.each do |val|
            temp_suit << val.card_shape
            temp_num << val.card_value.to_i
        end
    end

    def dux_loop(array, num) #does a double loop on suit or value to tell how many are the same
        array.each do |val|
            counter = 0
            array.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == num
                return true
            end
        end
        false 
    end

    def array_increments(step, array) #checks to see if values are incrementing (example = 1,2,3,4,5)
        sorted = array.sort
        lastNum = array[0]
        sorted[1, sorted.count].each do |v|
            if lastNum + step != v
                return false
            end
            lastNum = v
        end
        true
    end

    def straight_flush(hand)
        prepare_cards(hand)
        if temp_suit.all? {|val| val == temp_suit[0] && array_increments(1, temp_num)}
            return true
        end
        false
    end

    def four_of_a_kind(hand)
        prepare_cards(hand)
        dux_loop(temp_num, 4) 
    end

    def full_house(hand)
        prepare_cards(hand)
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == 3
                temp_num.delete(val)
                if temp_num[0] == temp_num[1]
                    return true
                end
            end
        end
        false
    end

    def full_house_high_card(hand)
        prepare_cards(hand)
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == 3
                return val
                if temp_num[0] == temp_num[1]
                  
                end
            end
        end
   
    end

    def flush(hand)
        prepare_cards(hand)
        dux_loop(temp_suit, 5)
    end

    def straight(hand)
        prepare_cards(hand)
        array_increments(1, temp_num)
    end

    def three_of_a_kind(hand)
        prepare_cards(hand)
        dux_loop(temp_num, 3)
    end

    def two_pair(hand)
        prepare_cards(hand)
        array1 = []
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter +=1
                end
            end
            if counter == 2
                array1 << val
                temp_num.delete(val)
            end
        end
            if array1.length == 2
                return true
            end
        false
    end

    def two_pair_high_card_one(hand)
        prepare_cards(hand)
        array1 = []
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter +=1
                end
            end
            if counter == 2
                array1 << val
                temp_num.delete(val)
            end
        end
        return array1.sort().last
    end

    def two_pair_high_card_two(hand)
        prepare_cards(hand)
        array1 = []
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter +=1
                end
            end
            if counter == 2
                array1 << val
                temp_num.delete(val)
            end
        end
        return array1.sort().first
    end

    def two_pair_high_card_three(hand)
        prepare_cards(hand)
        array1 = []
        temp_num.each do |val|
            temp_num.each do |val2|
                if val == val2
                    temp_num.delete(val)
                end
            end
        end
        return temp_num.last
    end

    def pair(hand)
        prepare_cards(hand)
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == 2
                return true
            end
        end
        false 
    end

    def high_card(hand)
        prepare_cards(hand)
        return temp_num.sort().last
    end

    def ranking(hand)
        values = {pair(hand) => 1, two_pair(hand) => 2, three_of_a_kind(hand) => 3, straight(hand) => 4, flush(hand) => 5, full_house(hand) => 6, four_of_a_kind(hand) => 7, straight_flush(hand) => 8}
        rank = 0
        values.each do |key, value|
            if key 
                rank = value
            end
        end
        rank
    end

    def comparison(black, white)
        if ranking(white) > ranking(black)
            return "white wins"
        elsif ranking(white) < ranking(black)
            return "black wins"
        elsif ranking(white) == ranking(black)
            if ranking(white) == 2 && ranking(black) == 2
               if two_pair_high_card_one(white) == two_pair_high_card_one(black)
                    if two_pair_high_card_two(white) == two_pair_high_card_two(black)
                        if two_pair_high_card_three(white) == two_pair_high_card_three(black)
                            return "it's a tie"
                        else
                            if two_pair_high_card_three(white) > two_pair_high_card_three(black)
                                return "white wins"
                            else
                                return "black wins"
                            end
                        end
                    elsif two_pair_high_card_two(white) > two_pair_high_card_two(black)
                        return "white wins"
                    else 
                        return "black wins"
                    end
                elsif two_pair_high_card_one(white) > two_pair_high_card_one(black)
                    return "white wins"
                else
                    return "black wins"
                end
            end
        end
        
    end   
end